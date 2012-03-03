class MendeleyController < ApplicationController

  def get_library
    require 'net/http'
    require 'uri'

    url = 'http://api.mendeley.com/oapi/library/';

    parsed_url = URI.parse( url )

    Net::HTTP.start( parsed_url.host ) { | http |
      req = Net::HTTP::Get.new "#{ parsed_url.path }?#{ current_user.mendeley_query_string(parsed_url) }"
      response = http.request(req)
      @mendeley_response = response.read_body
    } 
  end
end
