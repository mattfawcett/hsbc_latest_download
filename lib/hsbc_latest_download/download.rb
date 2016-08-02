require "selenium-webdriver"

module HsbcLatestDownload
  class Download
    HSBC_URL = 'https://www.hsbc.co.uk/'

    def initialize(options)
      @options = options
    end

    def run!
      driver = Selenium::WebDriver.for :chrome
      driver.navigate.to HSBC_URL

      driver.find_element(partial_link_text: 'Log on').click

      element = driver.find_element(:name, 'userid')
      element.send_keys @options[:username]
      element.submit

      driver.find_element(partial_link_text: 'Without Secure Key').click

      driver.find_element(name: 'memorableAnswer').send_keys(@options[:memorable_answer])

      (1..8).each do |char|
        field = driver.find_element(name: "pass#{char}")
        unless field.attribute('disabled')
          letter = password_character(char)
          field.send_keys(letter)
        end
      end

      driver.find_element(class: 'submit_input').click

      driver.find_element(:link_text, @options[:account_name]).click
      driver.find_element(:link_text, 'Download transactions').click

      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      wait.until { driver.find_element(:name =>  'downloadType') }

      file_type = driver.find_element(:name, 'downloadType')
      file_type.find_elements( :tag_name => "option" ).find do |option|
        option.text == 'Money 98 onwards (OFX)'
      end.click

      driver.find_element(:link_text, 'Continue').click
      driver.find_element(:link_text, 'Confirm').click

      sleep 10

      driver.find_element(partial_link_text: 'Log off').click
      driver.quit
    end

    def password_character(number)
      if number <= 6
        return @options[:password][number-1, 1]
      elsif number == 7
        # second to last character
        return @options[:password][@options[:password].length-2, 1]
      else
        # last character
        return @options[:password][@options[:password].length-1, 1]
      end
    end
  end
end
