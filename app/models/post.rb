class Post < ApplicationRecord
    validates :title ,presence: true
    validates :description ,presence: true 
    validates_length_of :title, minimum: 3, maximum: 20
    validates_length_of :description, minimum: 10, maximum: 100
    has_many :comments
    
end
