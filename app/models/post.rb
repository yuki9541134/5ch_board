class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 500}}
    validates :title_id, {presence: true}
    validates :user_id, {presence: true}
end
