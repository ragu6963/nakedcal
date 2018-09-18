class Comment < ActiveRecord::Base
    resourcify
    belongs_to:user
    belongs_to:post
    
end
