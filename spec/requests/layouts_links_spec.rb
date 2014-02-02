require 'spec_helper'

describe "LayoutsLinks" do

	it "should have a Home Page at '/'" do
	get '/'
	response.should have_selector('title',:content=>"Home")
	end
	it "should have a Contact Page at '/contact'" do
	get '/contact'
	response.should have_selector('title',:content=>"Contact")
	end
	it "should have a About Page at '/about'" do
	get '/about'
	response.should have_selector('title',:content=>"About")
	end
	it "should have a Help Page at '/help'" do
	get '/help'
	response.should have_selector('title',:content=>"Help")
	end
	it "should have a Signup Page at '/signup'" do
	get '/signup'
	response.should have_selector('title',:content=>"Sign Up")
	end
	it "should have a right link on the layout" do
	visit root_path
	response.should have_selector('title',:content=>"Home")
	click_link "About"
	response.should have_selector('title',:content=>"About")
	click_link "Contact"
	response.should have_selector('title',:content=>"Contact")
	click_link "Sign Up Now!"
	response.should have_selector('title',:content=>"Sign up")
	response.should have_selector('a[href="/"]>img')
	end
end
