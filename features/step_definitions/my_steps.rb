Given(/^someone goes to guitarcenters website$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto "www.guitarcenter.com"
end


When(/^they enter a search term of "([^"]*)"$/) do |search_value|
  #First we want to wait for the main page to load. This is because guitarcenter.com redirects to /Home.
  @browser.div(:id=>"footerContentContainer").wait_until_present #I'm waiting for the footer to finish loading. Then I will know the page is fully loaded.after() do
  #Second, we need to find the search box. It's a text box, which watir calls text_fields
  @browser.text_field(:id => "header-search-input").set "#{search_value}" #the .set sends the text passed in, to the search field.
  #Third, we click the search button.  As an alternative, we could send a ENTER keystroke use send_keys
  @browser.input(:id=>"SearchSubmit").click
end

Then(/^they get results about "([^"]*)"$/) do |search_results|
  #For the assertion, the normal include? won't work, we have to force an assertion using assert.
  #Also notice that we pass the search_result outside of quotes since it's coming in with Quotes.
  sresults = @browser.span(:class=>"grid-product-name").text.include? search_results
  assert(sresults == true)
end