# sanatize:string
class Post < ApplicationRecord
  include Filterable

  self.table_name = 'posts'
  self.primary_key = 'id'

  scope :recents, -> { where(created_at: :desc).limit(3) }
  scope :by_user, -> (user) { where(user_id: user.id) }

  # Relationships
  belongs_to :user

  validates :name,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 30 }

  validates :description,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 145 }

  validates :content,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimu: 3, maximum: 4000 }

  validates :tags,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 80 }
end
