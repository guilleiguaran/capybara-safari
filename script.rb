require "capybara"
require "capybara/dsl"
require "selenium/webdriver"
require "chromedriver/helper"

Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.default_driver = :selenium_chrome # :selenium_safari
Capybara.javascript_driver = :selenium_chrome # :selenium_safari
Capybara.run_server = false
Capybara.app_host = "https://en.wikipedia.org"

class Runner
  include Capybara::DSL

  def run
    visit "/wiki/Main_Page"
    fill_in "search", with: "Wikipedia"
    find(:xpath, "//input[@name='go']").click

    puts current_url
  end
end

Runner.new.run
