class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :posts
  has_many :comments

  def has_role?(role)
  	if self.roles.where(name: role).length > 0
  		true
  	else
  		false
  	end
  end
end
