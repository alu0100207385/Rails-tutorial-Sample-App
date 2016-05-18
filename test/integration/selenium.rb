require 'selenium-webdriver'
require 'test/unit'

include Rack::Test::Methods
include Test::Unit::Assertion

describe "#1. Test" do

	before :all do
		client = Selenium::WebDriver::Remote::Http::Default.new
		client.timeout = 600 # seconds
        caps = Selenium::WebDriver::Remote::Capabilities.firefox(
            #:version               => "41",
            #:platform              => "VISTA",
            #:video                 => "True"
        )
        @driver = Selenium::WebDriver.for(:remote, :url => "http://selhub:4444/wd/hub", :http_client => client, :desired_capabilities => caps)
        @driver.manage.timeouts.implicit_wait = 60 # seconds
        @driver.manage.window.maximize # If Linux always set window size like driver.manage.window.size = Selenium::WebDriver::Dimension.new(1920, 1080)
    end

	after :all do
		@driver.quit
	end

	it "#1 I can access index" do
        @driver.find_element(:link_text, "Sing up now!").click
		assert_equal(@driver.find_element(:tag_name, "h1").text, "Sign up")
	end
end
