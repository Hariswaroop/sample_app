require 'spec_helper'

describe PagesController do
	render_views

	before(:each) do
		@base_title="Have Fun"
	end
 
 	describe "GET 'home'" do
 		describe "when not sign in" do
 			it "should be successful" do
      			get 'home'
      			response.should be_success
      		end

      		it "should have the right title" do
				get 'home'
				response.should have_selector("title",:content=>"#{@base_title}|Home")
			end

			it "should have the non-blank body" do
				get 'home'
				response.body.should_not =~ /<body>\s*<\/body>/
			end
		end


		describe "when signed in" do
			before(:each) do
				@user=test_sign_in(Factory(:user))
				other_user=Factory(:user, :email=>Factory.next(:email))
				other_user.follow!(@user)
			end	

			it "should have the right follower/following counts " do
				get :home
				response.should have_selector('a', :href=>following_user_path(@user), 
												:content=>" 0 following")
				response.should have_selector('a',:href=>follower_user_path(@user),
												:content=>" 0 follower")
 			end
 	 	end
 	end

  	describe "GET 'contact'" do
    	it "returns http success" do
      		get 'contact'
      	response.should be_success
    	end
		it "should have the right title" do
			get 'contact'
			response.should have_selector("title",:content=>"#{@base_title}|contact")
		end
  	end

	describe "GET 'about'" do
    	it "returns http success" do
      		get 'about'
      		response.should be_success
	    end
		it "should have the right title" do
			get 'about'
			response.should have_selector("title",:content=>"#{@base_title}|about")
		end
	  end

    describe "GET 'help'" do
    	it "returns http success" do
      		get 'help'
     	 	response.should be_success
    	end
	
		it  "should have the right title" do
			get 'help'
			response.should have_selector("title",:content=>"#{@base_title}|help")
		end
  	end
end
