class User < ApplicationRecord
  include ImageHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # relationships
  has_one_attached :image
  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :image_type
  validates :image_size
end
