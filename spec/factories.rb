Factory.define :user do |user|
	user.name   "hariswaroop"
	user.email   "hariswaroop@gmail.com"
	user.password "foobar"
	user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end