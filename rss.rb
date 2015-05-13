#!/usr/bin/env ruby
#
require 'rss'
require 'open-uri'
require 'colorize'

url = ARGV[0]

open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  puts "Title: ".cyan << "#{feed.channel.title}\n".white
  feed.items.each_with_index do |item, index|
    puts "#{item.title}".green
    puts "#{item.link}".yellow
    if (index < (feed.items.length - 1))
      then
        puts
    end
  end
end
