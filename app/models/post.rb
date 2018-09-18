class Post < ActiveRecord::Base
    resourcify
    
    belongs_to:user
    has_many :comments 

    mount_uploader :file1, ImageUploader
    mount_uploader :file2, ImageUploader
    mount_uploader :file3, ImageUploader
end
