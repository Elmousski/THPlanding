require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pp'


class ScrapperEmails    


  def write_json_list(filename = 'db/email.json')
   Dir.mkdir 'db' unless Dir.exist? 'db'
   json_list = @list.to_json
   f = File.open(filename, 'w')
   f.write(json_list)
   f.close
end  


def read_json_from_db(filename = 'db/email.json')
   f = File.open(filename, 'r')
   list = ''
   while (line = f.gets)
     list += line
   end
   f.close
   @list = JSON.parse(list)
end 

def get_the_email_of_a_townhal_from_its_webpage(url)
     page = Nokogiri::HTML(open(url))
     page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 enddef get_the_district(url)
   page = Nokogiri::HTML(open(url))
   page.xpath("//body/div/main/section[4]/div/table/tbody/tr[1]/td[2]").text
 enddef get_all_the_urls_of_var
   array = []
   @var_names = []
   @var_emails = []
   urls = %w[http://www.annuaire-des-mairies.com/nord.html]
   urls.each do |url|
   doc = Nokogiri::HTML(open(url))
   doc.css(".lientxt").each do |link|
     url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
     var_name = link.text
     var_email = get_the_email_of_a_townhal_from_its_webpage(url)
     var_district = get_the_district(url)
     var = {:name => var_name, :email => var_email, :district => var_district}
     array << var
     @var_names << var_name
     @var_emails << var_email
     end
   end
   return array
end  

def json_test
 File.open("db/email.json", "w") do |x|
 x.write(json_test1.to_json)
 end
 end