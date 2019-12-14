require 'sidekiq'
require 'net/http'
require 'uri'
require 'open-uri'
require 'selenium-webdriver'

class WeatherWorker
  include Sidekiq::Worker

  def perform(user_id)
    @weather = Weather.new({ user_id: user_id, measurement_date: today.strftime("%F") })
    get_soil_data
    get_weather_data
    get_rain
    @weather.save!
  end

  private

  def get_weather_data
    url = "https://api.openweathermap.org/data/2.5/weather"
    weather_data = http_get(url, { zip: '08867,us', units: 'imperial' })
    @weather['max_temp'] = weather_data['main']['temp_max']
    @weather['min_temp'] = weather_data['main']['temp_min']
    @weather['avg_temp'] = weather_data['main']['temp']
  end

  def get_rain
    driver = js_load("http://newa.nrcc.cornell.edu/newaLister/dly/289/2019/#{today.month}")
    elements = driver.find_elements(css: 'td')
    @weather['precipitation'] = elements[elements.count - 12].text.to_f
    @weather['avg_wind_speed'] = elements[elements.count - 10].text.to_f
    @weather['solar_radiation'] = elements[elements.count - 9].text.to_i
  end

  def get_soil_data
    url = "https://www.njweather.org/inc/get_mesonet_data.php"
    params = { back: '1 days', elems: [576], stn: 289, res: 'hourly' }
    resp = eval(http_get(url, params)['data'][0].gsub(/Date.UTC/, 'DateTime.new'))
    days_values = resp.select do |array|
      array[0].strftime("%F  %T").include?(1.month.ago.strftime("%F"))
    end
    @weather['max_soil_temp'] = days_values.max[1]
    @weather['min_soil_temp'] = days_values.min[1]
    get_soil_data_2
  end

  def get_soil_data_2
    url = "http://api.agromonitoring.com/agro/1.0/soil"
    response = http_get(url, { polyid: User.last.ag_api_id })
    puts response
    @weather['soil_surface_temp'] = kelvin_to_f(response['t0'])
    @weather['soil_10cm_temp'] = kelvin_to_f(response['t10'])
    @weather['soil_moisture'] = response['moisture']
  end

  def http_get(url, params)
    response = Faraday.get(url, params.merge!({ appid: ENV['FARM_API'] }),
      {'Accept' => 'application/json'})
    JSON.parse(response.body)
  end

  def js_load(url)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.manage.timeouts.implicit_wait = 10
    driver.get(url)
    driver
  end

  def kelvin_to_f(deg)
    (deg - 273.15) * 9/5 + 32
  end

  def today
    @_today ||= Date.today
  end
end