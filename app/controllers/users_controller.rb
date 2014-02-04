class UsersController < ApplicationController
  def new
<<<<<<< HEAD
   @title="Sign Up" 
   @user=User.new 
  end

  def show
  @user=User.find(params[:id])
  @title=@user.name
  end

  def create
 	@user=User.new(params[:user])
	if @user.save
  sign_in @user
	redirect_to @user, :flash=>{:success=>"welcome to Sample app!"} 
   else
	@title="sign up"
	render 'new'
  end
 end 
=======
@title="Sign Up"  
  end
>>>>>>> origin/filling-in-layout
end
