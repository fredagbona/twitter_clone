class Post < ApplicationRecord
    validates :name, presence: true, length: { minimum: 1, maximum: 140}
    validates :content, presence: true, length: { minimum: 1, maximum: 140}

end
