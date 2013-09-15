#Area code to state/city checker
#Using the AllAreaCodes.com API
#
# http://www.allareacodes.com/api/1.0/api.json
#
##GET PARAMS##
# npa - 3 digit area code for lookup
# tracking_email - valid email used to contact admin in case of issues
# tracking_url - URL in which API is displayed for others
#
require 'rubygems'
require 'httparty'
require 'json'

class AreaCode
  include HTTParty
  attr_accessor :response
  #This is optional... why?
  #format :json

  def initialize
  @response = response 
  end

  def grab_npa(npa)
  @response = HTTParty.get("http://www.allareacodes.com/api/1.0/api.json?"+
                           "npa=#{npa}&" +
                           "tracking_email=bob@example.com&" +
                           "tracking_url=http://example.com")
  body = JSON.parse(@response)
  x = body["area_codes"][0]
  x.each { |key, value| puts "#{key}: #{value}"}
  end
end

test = AreaCode.new
puts "Please enter area code: "
areaCode = gets.to_i
test.grab_npa(areaCode)
