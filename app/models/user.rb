class User < ApplicationRecord






  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable





  validates :email,:name, presence: true
  validates :name, length: { in:2..20 }


   has_many :books, dependent: :destroy
   has_many :book_images, dependent: :destroy

   attachment :profile_image





  def email_required?
    false
  end
  def email_changed?
    false
  end



  def books
  return Book.where(user_id: self.id)
  end




end
