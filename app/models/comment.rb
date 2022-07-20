class Comment < ApplicationRecord
    validates :body ,presence: true
    validates_length_of :body, minimum: 3, maximum: 100
    belongs_to :post
end
