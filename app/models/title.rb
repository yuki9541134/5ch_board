class Title < ApplicationRecord
    validates :name, {presence: true, length: {maximum: 50}}
    
    def posts
        return Post.where(title_id: self.id)
    end
end
