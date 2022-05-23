class User < ApplicationRecord
  include ImageHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # relationships
  has_one_attached :image, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy

  # validations
  validate :image_type
  validate :image_size
  validates :name, presence: true
  validates_length_of :name, maximum: 200
end
