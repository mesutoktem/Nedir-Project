require 'nokogiri'
require 'open-uri'

class DataCrawlerController < ApplicationController

  def get_url_content(url)


    doc = Nokogiri::HTML(open('http://tdk.gov.tr/index.php?option=com_seslissozluk&view=seslissozluk&kelime1=a&kategori1=yazim_listeli&ayn1=bas&konts=0'))


    puts doc.to_html

  end

end