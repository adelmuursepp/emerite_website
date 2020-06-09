class ResourceComment < ApplicationRecord
  # belongs_to :user
  belongs_to :resource_item

  validates :content, presence: true, length: { minimum: 4, maximum: 1000 }

  #after_create_commit { CommentBroadcastJob.perform_later(self) }

  def self.by_recent
    order("created_at DESC")
  end
end
