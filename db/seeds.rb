require 'date'
require 'open-uri'
require 'nokogiri'

url = "https://www.senscritique.com/bd/tops/top100-des-top10"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
User.create(email: "1@gmail.com", password: "azerty")

html_doc.search('.elto-item').take(50).each do |element|
  colonne = element.search('.elto-flexible-column')
  title = colonne.search('h2 a').text
  description = colonne.search(".elco-description").text.strip
  date = colonne.search('h2 span').text.tr('()', '').to_i
  cadre = element.search('figure').search('.d-link .lazy')
  photo = cadre.css('img').attribute('data-original').value
  address = "14 rue valiton, clichy"

  price = (1..10).to_a.sample

  comic = Comic.new(title: title, publication_date: date, category: "undefined", description: description, user_id: 1, price: price,address: address)
  comic.remote_photo_url = photo
  comic.user = User.first
  comic.save
end

