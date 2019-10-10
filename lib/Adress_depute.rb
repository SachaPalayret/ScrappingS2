require 'rubygems'

require 'nokogiri'

require 'open-uri'

# recuperer dans un tab toute les abreviation de money

doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

hash = Hash.new(0)

hash =   {

    "first_name" => "Jean",

    "last_name" => "Durant",

    "email" => "jean.durant@assemblée.fr"

  }

array_hash=[]

array_depute=[]

doc.xpath("//*[@id='deputes-list']/div/ul/li/a").each do |node|

  array_depute << node['href']

end

array_depute.each { |link|

  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr"+link))

  hash = Hash.new(0)

  doc.xpath("//*[@id='haut-contenu-page']/article/div[2]/h1").each do |node|

    str=node.text

    array_str=str.split(' ')

    hash.store("first_name",array_str[1])

    hash.store("last_name",array_str[2])

  end

  doc.xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[2]/a").each do |node|

    mail=node.text

    hash.store("email",mail)

  end

  puts hash

  array_hash << hash

}