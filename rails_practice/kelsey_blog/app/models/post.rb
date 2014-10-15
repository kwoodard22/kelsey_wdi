class Post < ActiveRecord::Base
  scope :draft, -> { where(draft_status: true) }
  scope :is_published, -> { where(draft_status: false) }
  scope :most_recent, -> { is_published.order('published desc').limit(10) }

end
