#!/usr/bin/env ruby

require 'simple-rss'
require 'open-uri'
require 'colorize'

FeedLimit = 10

url = ARGV[0]

class Object
  def numeric?
    true if Float(self) rescue false
  end
end

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
  while (choice = $stdin.gets.chomp) do
    if (choice.numeric?)
      `open -a #{ENV['BROWSER']} #{feed.items[choice.to_i].link}`
    elsif (choice.empty?)
      break;
    else
      puts "Must choose a number within range of options.".red
    end
    printf "Choose article: ".cyan
  end
end
