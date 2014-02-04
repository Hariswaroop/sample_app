class UsersController < ApplicationController
  before_filter :authenticate, :only=>[:index,:edit,:update] 
  before_filter :correct_user, :only=>[:edit,:update]
  
  def index
  @users=User.all
  @title="All users"
  end
  
  def new
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

 def edit
  @user=User.find(params[:id])
  @title="Edit user"
 end

 def update
  @user=User.find(params[:id])
  if @user.update_attributes(params[:user])
    redirect_to @user, :flash=>{:success=>"Profile updated."} 
  else
    @title="Edit user"
    render 'edit'
  end
end

  private
  def  authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
    end
end
