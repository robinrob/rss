#!/usr/bin/env ruby

require 'simple-rss'
require 'open-uri'
require 'colorize'

FeedLimit = 10

url = ARGV[0]

open(url) do |rss|
  feed = SimpleRSS.parse open(url)
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
