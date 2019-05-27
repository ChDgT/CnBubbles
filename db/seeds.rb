require 'date'
require 'open-uri'
require 'nokogiri'

url = "https://www.senscritique.com/bd/tops/top100-des-top10"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.elto-item').each do |element|
  colonne = element.search('.elto-flexible-column')
  title = colonne.search('h2 a').text
  description = colonne.search(".elco-description").text.strip
  date = colonne.search('h2 span').text.tr('()', '').to_i
  cadre = element.search('figure').search('.d-link .lazy')
  photo = cadre.css('img').attribute('data-original').value

  price = (1..10).to_a.sample

  Comic.create(title: title, publication_date: date, description: description, category: 'undefined', photo: photo, user_id: 1, price: price)
end

