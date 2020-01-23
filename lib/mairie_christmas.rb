require 'nokogiri'
require 'rubygems'
require 'open-uri'

def get_city_url
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  townhall_links = page.css("a[class=lientxt]")
  city_url = []
  townhall_links.each{|url_end| city_url << "https://www.annuaire-des-mairies.com#{url_end['href'].delete_prefix(".")}"}
  return city_url
end 

def array_of_mails(city_url)
  emails = []
  city_url.each{|url| 
    page = Nokogiri::HTML(open("#{url}"))
    emails << page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
}
  return emails
end

def array_of_names (city_url)
  names = []
  city_url.each{|url| 
    page = Nokogiri::HTML(open("#{url}"))
    names << page.xpath("/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a").text
}
  return names
end


def finalHash(names, emails)
  hash = Hash[names.zip(emails)]
  array_of_hashes = []
  hash.each{|key, value| array_of_hashes << {key => value}}
  return array_of_hashes
end


def perform
  puts finalHash(array_of_names(get_city_url),array_of_mails(get_city_url))
end

perform