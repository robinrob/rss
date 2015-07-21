# RSS Opener

Short Ruby script that presents a pretty terminal interface for quickly opening links from RSS feeds.

## Installation

-- `bundle install` to install required Ruby Gems.

## Usage

`./rss-opener.rb <rss url> <article limit>`

Articles are limited to top 10 by default.

### Examples

Display top 10 news items from Hacker News RSS feed:
`./rss-opener.rb https://news.ycombinator.com/rss`

Display top 20 news items from Hacker News RSS feed:
`./rss-opener.rb https://news.ycombinator.com/rss 20`