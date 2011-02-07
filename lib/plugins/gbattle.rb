require 'nokogiri'
require 'open-uri'
require 'gchart'
require 'googl'

on :channel, /^:gbattle (.*) (.*)/i do
  query1 = Nokogiri::HTML(open("http://www.google.com/search?q=#{match[0]}"))
  query2 = Nokogiri::HTML(open("http://www.google.com/search?q=#{match[1]}"))

  results1 = query1.css('#resultStats').inner_text.gsub(/^About /, '').gsub(/results.*$/, '').gsub(/,/, '').to_i
  results2 = query2.css('#resultStats').inner_text.gsub(/^About /, '').gsub(/results.*$/, '').gsub(/,/, '').to_i

  winner  = results1 > results2 ? match[0] : match[1]
  loser   = results1 > results2 ? match[1] : match[0]
  delta   = (results1 - results2).abs

  map_url = GChart.bar(
                :data => [results1,results2],
                :legend => ["#{match[0]} #{results1}", "#{match[1]} #{results2}"],
                :title => "#{match[0]} vs. #{match[1]}"
            ).to_url

  map_url = Googl.shorten(map_url).short_url

  msg channel, "#{winner} beat #{loser} by #{delta}. #{map_url}"
end
