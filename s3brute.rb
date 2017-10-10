require 'net/http'
require 'uri'
require 'fileutils'

if ARGV.length != 1
        puts "Missing wordlist (usage: s3brute.rb wordlist.txt)"
        exit 0
end
filename = ARGV.shift

hosts = ["s3-us-east-2", "s3-external-1", "s3-us-west-1", "s3-us-west-2", "s3-ca-central-1", "s3-ap-south-1", "s3-ap-northeast-2", "s3-ap-southeast-1", "s3-ap-southeast-2", "s3-ap-northeast-1", "s3-eu-central-1", "s3-eu-west-1", "s3-eu-west-2", "s3-sa-east-1"]

def get_page (hosts, page)
uri = URI.parse("http://#{hosts}.amazonaws.com/#{page}")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
res = http.request(request)
if res.code == "200"
        puts "Bucket found that is publicly listable: http://#{hosts}.amazonaws.com/#{page}"
elsif res.code == "403"
        puts "Bucket found but listing denied: http://#{hosts}.amazonaws.com/#{page}"
else
#       puts "Bucket does not exist: http://#{hosts}.amazonaws.com/#{page}"
end
end

File.open(filename, "r") do |f|
  f.each_line do |line|
  line.strip!
  if line == ""
        next
  end
  hosts.each do |host|
  host.chomp('[')
   get_page("#{host}", "#{line}")
  end
  end
end
