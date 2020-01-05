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
    puts '**************************'
    puts @weather.to_json
    get_weather_data
    @weather.save!
  end


5dd1ac80ae8d9e0013fc2ba5
  def get_weather_data
    response = Faraday.get("https://api.openweathermap.org/data/2.5/weather",
      { appid: ENV['WEATHER_API'], zip: '08867,us', units: 'imperial' })
    
    wd = JSON.parse(response.body)
    puts '$$$$$$$$$$$$$$$$$$$$$$$$$$'
    puts wd
    @weather['max_temp'] = wd.deep_find('temp_max')
    @weather['min_temp'] = wd.deep_find('temp_min')
    @weather['precipitation'] = wd[3]
  end

  def get_rain
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.get("http://newa.nrcc.cornell.edu/newaLister/dly/289/2019/11")
    count = driver.find_elements(css: 'td').count - 20
    element = driver.find_elements(css: 'td')[count]
    puts element
    puts element.text
 
  end

  def get_soil_data
    
    response = Faraday.get("http://api.agromonitoring.com/agro/1.0/soil",
      { appid: ENV['FARM_API'], polyid: User.last.ag_api_id },
      {'Accept' => 'application/json'})
    sd = JSON.parse(response.body).deep_find(1.day.ago.strftime("%F"))
    @weather['max_soil_temp'] = sd.dig('soil_temp_max_0to10cm', 'value')
    @weather['min_soil_temp'] = sd.dig('soil_temp_min_0to10cm', 'value')
  end
end