class UsersController < ApplicationController
  before_filter :authenticate, :except =>[:show, :new, :create] 
  before_filter :correct_user, :only=>[:edit,:update]
  before_filter :admin_user, :only=>[:destroy]
 
  def index

    @users=User.paginate(:page=>params[:page])
    @title="All users"
  end
  
  def new
   @title="Sign Up" 
   @user=User.new 
  end

  def show
    @user=User.find(params[:id])
    @title=@user.name
    @microposts=@user.microposts.paginate(:page=>params[:page])
  end

  def following
    @title="Following"
    @user=User.find(params[:id])
    @users=@user.following.paginate(:page=>params[:page])
    render 'show_follow'
  end

  def followers
    @title="Followers"
    @user=User.find(params[:id])
    @users=@user.followers.paginate(:page=>params[:page])
    render 'show_follow'
  end

  def create
 	  @user=User.new(user_params)
	   if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
	     redirect_to @user, :flash=>{:success=>"welcome to Have Fun!"} 
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

 def destroy
    @user.destroy
    redirect_to users_path,:flash=> {:success=>"User Destroyed" }
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    def  authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      @user=User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
      end
end
