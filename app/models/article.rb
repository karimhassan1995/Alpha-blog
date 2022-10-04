class Article < ApplicationRecord
    validates :name, presence: true , length: {minimum: 6 , maximum:500}
    validates :description, presence: true , length: {minimum: 6 , maximum:500}

end