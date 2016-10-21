require 'json'
require 'pry'
class VersionFetcher
  attr_reader :gem_name

  def initialize(gem_name)
    @gem_name = gem_name
  end
  
  def fetch    
    result = `curl https://rubygems.org/api/v1/versions/#{gem_name}.json`
    begin
      json = JSON.parse(result)
      json.map { |s| s["number"] }
    rescue JSON::ParserError
       puts "Error. Check the way of writing gem name".red
    end 
  end
end
