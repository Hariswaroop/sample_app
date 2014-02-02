require 'spec_helper'

describe User do
before(:each) do
@attr={:name=>"Example User", :email=>"user@example.com"}
end

it "should create a new instance given a valid attribute" do
User.create!(@attr)
end

it "should require a name" do
no_name_user=User.new(@attr.merge(:name=>""))
no_name_user.should_not be_valid
end
it "should require an email" do
no_email_user=User.new(@attr.merge(:email=>""))
no_email_user.should_not be_valid
end

it "should reject names that are too long"
long_name="a"*51
long_name_user=User.new(@attr.merge(:name=>long_name))
long_name_user.should_not be_valid
 end
 it "should accept valid email address" do
 address=%w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
 address.each do |adddress|
	valid_email_user=User.new(@attr.merge(:email=>address))
	valid_email_user.should be_valid
  end
 end
 it "should reject invalid email address" do
 address=%w[user@foo,com user_at_foo.org example.user@foo]
 address.each do |adddress|
	invalid_email_user=User.new(@attr.merge(:email=>address))
	invalid_email_user.should_not be_valid
  end
end
it "should reject duplicate email addresses" do
User.create!(@attr)
user_with_duplicate_email=User.new(@attr)
user_with_duplicate_email.should_not be valid
end
it "should reject email address identical up to case" do
upcased_email=@attr[:email].upcase
User.create!(@attr.merge(:email=>upcased_email))
User_with_duplicate_email=User.new(@attr)
user_with_duplicate_email.should_not be valid

end
end