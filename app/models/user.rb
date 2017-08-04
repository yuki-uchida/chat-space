class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #association
  has_many :group_users
  has_many :groups, through: :group_users

  validates :name, presence: true

  scope :users_get, -> (current_user, params) { where.not(id: current_user.id).where('name LIKE ?', "%#{params[:keyword]}%")
 }

end
