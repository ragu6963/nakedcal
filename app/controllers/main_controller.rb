class MainController < ApplicationController
  before_action :authenticate_user!   
  def home
    current_user.age = Date.today.year - current_user.birthday.year + 1
    current_user.save 
    
      begin
        @user = User.find(params[:id])
      rescue Exception
        @user = current_user
      end
      
      @user.count = Post.where(user: @user).count 
      @user.save
      
      @post = Post.all 
      
      if current_user.has_role? :admin
        @search_result = User.all  
      else 
        @search_user = current_user
        birthday = @user.age
        today = Date.today 
        user_age = today.year - birthday.year + 1
        
        @age_min = user_age - 10  
        @age_max = user_age + 10 
         
        
        @search_result = User.where("age < ?", @age_max)
        @search_result = User.where("age > ?", @age_min ) 
        @search_result = User.where("id !=  ?", @user.id )
      end
      
  end

  def profile 
    begin
      @user = User.find(params[:id])
    rescue Exception
      @user = current_user
    end
    
    begin
      @p = Post.where(user: @user).last 
    rescue Exception   
    
    end 
  end

  def view 
    
    @date = params[:date]  
    
    begin
      @user = User.find(params[:id])
    rescue Exception
      @user = current_user
    end
     
    @p = Post.where(date: @date,user: @user).take
    
  end
  
  def share
    current_user.share = params[:share]
    current_user.save
    redirect_to "/home"
  end
  
  
  def user_adjust
    user = User.find(params[:u_id])
    user.nickname = params[:nickname]
    user.comment = params[:comment]
    user.profile = params[:profile]
    user.save
    redirect_to "/"
  end
  
  private
  
  def image_params
      params.require(:image).permit(:file1,:file2,:file3)
  end
  
  def post_params
    params.require(:post).permit(:content,:date,:w_date,:file1,:file2,:file3,:ok)
  end
end
