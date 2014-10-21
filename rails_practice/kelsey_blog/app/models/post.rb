class Post < ActiveRecord::Base
  scope :draft, -> { where(draft_status: true) }
  scope :is_published, -> { where(draft_status: false) }
  scope :most_recent, -> { order('published desc').limit(10).is_published }
  scope :search, -> (q) { where("subject LIKE ? OR body LIKE ?", "%#{q}%", "%#{q}%").most_recent }
  validates :subject, presence: true
  validates :body, presence: true
  
end
