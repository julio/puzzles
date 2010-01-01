#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

1.upto(npages = 205) do |page_index|
  puts "\nPage #{page_index} / #{npages}"
  doc = Nokogiri::HTML(
    open("http://interfacelift.com/wallpaper_beta/downloads/date/any/index#{page_index}.html"))

  xpath = '//div[@class="preview"]/div[@class="download"]/select[@class="select"]'
  doc.xpath(xpath).each do |element|
    link        = element['onchange'].split(',')
    image_index = "%05d" % link[1][1..-2].to_i
    image_name  = link.last[1..-3]
    image_path  = "http://interfacelift.com/wallpaper_beta/dl/#{image_index}_#{image_name}_1440x900.jpg"
    
    begin
      bits = open(image_path, 'User-Agent' => 'Ruby-Wget').read
      File.open("images/#{image_name}.jpg", 'w') {|f| f.write(bits)}
      print "."
    rescue Exception => e
      print "F[#{image_index}]"
    end
    STDOUT.flush
  end
  
end

puts ""
