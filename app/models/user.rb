class User < ActiveRecord::Base
  has_and_belongs_to_many :classrooms
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :surname, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }
end
