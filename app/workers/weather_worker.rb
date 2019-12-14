require 'sidekiq'
require 'net/http'
require 'uri'
require 'open-uri'
require 'selenium-webdriver'

class WeatherWorker
  include Sidekiq::Worker

  def perform(user_id)
    @weather = Weather.new({user_id: user_id})
    get_soil_data
    get_weather_data
    get_rain
    @weather.save!
  end

  private

  def get_weather_data
    url = "https://api.openweathermap.org/data/2.5/weather"
    weather_data = http_get(url, { zip: '08867,us', units: 'imperial' })
    @weather['max_temp'] = weather_data.deep_find('temp_max')
    @weather['min_temp'] = weather_data.deep_find('temp_min')
  end

  def get_rain
    driver = js_load("http://newa.nrcc.cornell.edu/newaLister/dly/289/2019/11")
    count = driver.find_elements(css: 'td').count
    @weather['precipitation'] = driver.find_elements(css: 'td')[count - 20].text.to_f
    @weather['avg_wind_speed'] = driver.find_elements(css: 'td')[count - 22].text.to_f
    @weather['solar_radiation'] = driver.find_elements(css: 'td')[count - 23].text.to_i
  end

  def get_soil_data2
    url = "https://www.njweather.org/inc/get_mesonet_data.php"
    params = { back: '1 days', elems: [580,576,584,588], stn: 289, res: 'hourly' }
    resp_data = http_get(url, params)['data']

  end

  def get_soil_data
    url = "http://api.agromonitoring.com/agro/1.0/soil"
    response = http_get(url, { polyid: User.last.ag_api_id })
    puts response
    soil_data = response.deep_find(1.day.ago.strftime("%F"))
    @weather['max_soil_temp'] = soil_data.dig('soil_temp_max_0to10cm', 'value')
    @weather['min_soil_temp'] = soil_data.dig('soil_temp_min_0to10cm', 'value')
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
  end

  def garbage
        # response = Faraday.get("https://api.openweathermap.org/data/2.5/weather",
    #   { appid: ENV['WEATHER_API'], zip: '08867,us', units: 'imperial' })
    
    # wd = JSON.parse(response.body)
        # response = Faraday.get("http://api.agromonitoring.com/agro/1.0/soil",
    #   { appid: ENV['FARM_API'], polyid: User.last.ag_api_id },
    #   {'Accept' => 'application/json'})
    # sd = JSON.parse(response.body)
  end

end