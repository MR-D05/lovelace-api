#!/usr/bin/ruby

puts "Sending request ..."
data_path = "/tmp/dat79tg78g88"
File.write data_path, ("A" * (1024 * 1024 * 10).round)
`curl --insecure -X POST --data \"@#{data_path}\" https://localhost/api:8080`
puts "Request sent."
File.unlink data_path
