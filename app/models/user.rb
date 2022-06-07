class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_save :create_membership

  has_one :membership

  def role?(role)
    self.role == role
  end

  def create_membership
    Membership.create(user_id: id, invited_by: current_user.id, effectivity_date: Date.today)
  end
  
end
