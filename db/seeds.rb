require 'date'
require 'open-uri'
require 'nokogiri'

url = "https://www.senscritique.com/bd/tops/top100-des-top10"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
User.create(email: "1@gmail.com", password: "azerty")

html_doc.search('.elto-item').take(30).each do |element|
  colonne = element.search('.elto-flexible-column')
  title = colonne.search('h2 a').text
  description = colonne.search(".elco-description").text.strip
  date = colonne.search('h2 span').text.tr('()', '').to_i
  cadre = element.search('figure').search('.d-link .lazy')
  photo = cadre.css('img').attribute('data-original').value

  # hello = Cloudinary::Uploader.upload(photo)
  # p image_url photo, host: "https://www.senscritique.com/bd/tops/top100-des-top10"



  comic = Comic.new(title: title, publication_date: date, category: "ooo", description: description, user_id: 1, price: 1)
  comic.remote_photo_url = photo
  comic.user = User.first
  comic.save
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

