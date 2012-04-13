class PagesController < ApplicationController

  caches_page :about, :services, :customers, :software

  def index
    # Para pillar los titulares del blog
    require 'rss'
    rss_feed = "http://feeds.feedburner.com/alabs/blog"
    rss = RSS::Parser.parse(rss_feed, false)
    @posts = []
    rss.items.each_with_index do |i, n|
      break if n == 5
      item = { 
        'link' => i.link,
        'title' => i.title,
      }
      @posts << item
    end
    @posts

    # Mostrar los últimos tweets
    @tweets = Twitter.user_timeline('alabs_es')[0,4]
    
    set_http_cache(3.hours, visibility = true)
  end

  def about
    set_http_cache(3.hours, visibility = true)
  end

  def services
    set_http_cache(3.hours, visibility = true)
  end

  def customers
    set_http_cache(3.hours, visibility = true)
  end

  def software
    set_http_cache(3.hours, visibility = true)
  end

  def contact
    @contact = Contact.new
  end

  def contact_message_received
    @contact = Contact.new(params[:contact])
    if @contact.save
      Mailman.contact(@contact).deliver
      flash[:notice] = 'Tu mensaje ha sido recibido, pronto nos pondremos en contacto.'
      redirect_to root_url
    else
      flash[:error] = 'Verifica los campos en rojo'
      render :action => :contact
    end
  end
end
