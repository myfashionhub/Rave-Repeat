require 'capybara/poltergeist'

module Kayak

  def self.parse(url)
    session = Capybara::Session.new(:poltergeist)
    session.driver.browser.js_errors = false
    session.visit url
    sleep 2

    page = session.within('content_div') do
      Nokogiri::HTML(session.html)
    end

  end

end
