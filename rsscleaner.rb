require 'sinatra'
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

urls = {}
urls["ohrenbaer"] = "http://www.ohrenbaer.de/podcast/podcast.feed.podcast.xml"

get '/:slug' do
  source = urls[params[:slug].to_s]
  content = ""
  open(source) do |s| 
    content = s.read 
  end
  rss = RSS::Parser.parse(content, false)
  
  content_type :rss 
  "#{rss}"
end
