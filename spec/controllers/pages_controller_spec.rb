require 'spec_helper'

describe PagesController do
render_views
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
	it "should have the right title" do
		get 'home'
		response.should have_selector("title",:content=>"Ror tut|Home")
	end
	it "should have the non-blank body" do
		get 'home'
		response.should_ not =~ /<body>\s*<\/body>
	end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
	it "should have the right title" do
		get 'contact'
		response.should have_selector("title",:content=>"Ror tut|contact")
	end
  end
describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
	it "should have the right title" do
		get 'about'
		response.should have_selector("title",:content=>"Ror tut|about")
	end
  end
  
end
