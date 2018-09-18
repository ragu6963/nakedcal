class CommentController < ApplicationController 
    before_action :authenticate_user!
    
    def c_write
        c = Comment.new
        c.user = current_user
        c.post_id = params[:p_id] 
        c.c_content = params[:c_text]
        c.cw_date = Time.current.in_time_zone("Seoul").strftime("%F %H:%M:%S")
        c.save
    
        redirect_to "/profile"  
    end
    
    def c_delete
       c = Comment.find(params[:c_id])
       authorize! :c_delete, c
       c.destroy
       redirect_to "/profile"  
    end
    
end
