class Book < ApplicationRecord



 belongs_to :user



# 追加


 def user
    return User.find_by(id: self.user_id)
  end


end
