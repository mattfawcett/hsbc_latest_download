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

      wait = Selenium::WebDriver::Wait.new(:timeout => 10)

      driver.find_element(partial_link_text: 'Log on').click

      wait.until { driver.find_element(:name => 'userid') }
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

      wait.until { driver.find_element(:partial_link_text =>  @options[:account_name]) }
      sleep 1
      driver.find_element(:partial_link_text, @options[:account_name]).click

      wait.until { driver.find_element(:partial_link_text =>  'Download') }
      driver.find_element(:partial_link_text, 'Download').click

      within_modal = "//div[contains(concat(' ',normalize-space(@class),' '),' dijitDialogFixed ')]"
      wait.until { driver.find_element(:xpath =>  "#{within_modal}//input[@value='ofx']") }
      driver.find_element(:xpath, "#{within_modal}//input[@value='ofx']").click

      driver.find_element(:xpath, "#{within_modal}//button[@data-dojo-attach-point='dapDownloadBtn']").click

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
