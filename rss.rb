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
      printf '['.cyan << "#{index}".white << '] '.cyan
      puts "#{item.title}".white
      puts "#{item.link}".yellow
      puts
    end
  end

  printf "Choose article: ".cyan
  while (choice = $stdin.gets.to_i) do
    `open -a #{ENV['BROWSER']} #{feed.items[choice].link}`
    printf "Choose article: ".cyan
  end
end
