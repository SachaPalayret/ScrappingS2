require 'rubygems'
require 'nokogiri'
require 'open-uri'

# recuperer dans un tab toute les abreviation de money

doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
hash = Hash.new(0)
hash.default
array_hash=[]


doc.xpath("//a[@class='lientxt']").each do |node|
  item_to_add = node.text
  item_link_to_add = node['href']
  item_to_add.to_s
  hash.store(item_to_add,item_link_to_add)
end

hash.each {|key,value|
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+value))
  node = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  item_to_add = node.text
  hash[key]=item_to_add
}


puts hash