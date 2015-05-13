#!/usr/bin/env ruby
#
require 'rss'
require 'open-uri'
require 'colorize'

url = ARGV[0]

FeedLimit = 10

open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  feed.channel.title.length.times { printf '-'.white }; puts
  printf "#{feed.channel.title}\n".cyan
  feed.channel.title.length.times { printf '-'.white }; puts; puts
  feed.items.each_with_index do |item, index|
    if (index < FeedLimit)
      then
      puts "#{item.title}".white
      puts "#{item.link}".yellow
      if ((index < (feed.items.length - 1)) && (index < (FeedLimit - 1)))
      then
        puts
      end
    end
  end
end
