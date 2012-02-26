class PagesController < ApplicationController

  def index
    # Para pillar los titulares del blog
    require 'rss'
    rss_feed = "http://feeds.feedburner.com/alabs/blog"
    rss = RSS::Parser.parse(rss_feed, false)
    @posts = []
    rss.items.each_with_index do |i, n|
      break if n == 4
      item = { 
        'link' => i.link,
        'title' => i.title,
      }
      @posts << item
    end
    @posts

    # Mostrar los últimos tweets
    @tweets = Twitter.user_timeline('alabs_es')[0,4]
  end

  def about
  end
end
