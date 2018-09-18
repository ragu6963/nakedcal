class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :profile, ImageUploader
  
  after_create :assign_default_role

  def assign_default_role 
    
    emails = ['bhj1684@naver.com']
  if emails.include? self.email
    self.add_role(:admin)
  end
      add_role(:student)
  end 
end
