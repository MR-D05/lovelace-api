#!/usr/bin/ruby

require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("http://localhost:8080/api")

http = Net::HTTP.new(uri.host, uri.port)
http.set_debug_output($stdout)

request = Net::HTTP::Post.new(uri)
request.content_type = "application/json"
request.body = JSON.dump({
  "action" => "Get_Token",
  "user" => "john",
  "password" => "test"
})

req_options = {
  use_ssl: uri.scheme == "https",
}

response = http.request(request)
puts response.body
