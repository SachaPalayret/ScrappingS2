#En prenant pour source le site CoinMarketCap,
#fait un programme qui récupère le cours de toutes les cryptomonnaies
#et les enregistre bien proprement dans
#un array de hashs.


#https://coinmarketcap.com/all/views/all/

require 'rubygems'
require 'nokogiri'
require 'open-uri'

# recuperer dans un tab toute les abreviation de money


doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
hash_coin = Hash.new(0)
hash_coin.default
array_hash=[]
doc.xpath("//a[@class='currency-name-container link-secondary']").each do |node|
  item_to_add = node.text
  item_to_add.to_s
  array_hash << item_to_add
  #hash_coin.store(item_to_add,0)
end

index=0

doc.xpath("//a[@class='price']").each do |node|
  item_to_add = node.text
  item_to_add.to_i
  hash_coin.store(array_hash[index],item_to_add)
  index=index+1
end

# class price && data-usd
puts hash_coin