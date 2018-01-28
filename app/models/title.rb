class Title < ApplicationRecord
    def posts
        return Post.where(title_id: self.id)
    end
end
