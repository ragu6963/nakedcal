class PostController < ApplicationController 
  before_action :authenticate_user!
  
    def p_write  
      p = Post.new  
      p.user = current_user 
      p.p_content = params[:content]
      p.date = params[:date]  
      p.w_date =  Time.current.in_time_zone("Seoul").strftime("%F %H:%M:%S")
      p.file1 = params[:file1]
      p.file2 = params[:file2]
      p.file3 = params[:file3] 
      p.save  
      redirect_to "/profile"
  end 
  
  def p_delete 
    
    p = Post.find(params[:p_id])
    authorize! :p_delete, @p
    
    p.comments.each do |c|
      c.destroy  
    end
    
    p.destroy 
    redirect_to "/profile"
  end
  
  def adjust
    
    @p = Post.find(params[:p_id])
    authorize! :adjust, @p
    
    @date = params[:date]
    @p.user = current_user 
    @p.p_content = params[:content]
    @p.date = params[:date] 
    @p.w_date = Time.current.in_time_zone("Seoul").strftime("%F %H:%M:%S")
    @p.file1 = params[:file1]
    @p.file2 = params[:file2]
    @p.file3 = params[:file3]
    @p.save  
    redirect_to "/profile"
    
  end
  
  private
  
   def image_params
      params.require(:image).permit(:file1,:file2,:file3)
  end
  
  def post_params
    params.require(:post).permit(:content,:date,:w_date,:file1,:file2,:file3,:ok)
  end
      
end
