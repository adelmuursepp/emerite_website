class ResourceTopic < ApplicationRecord
  belongs_to :resource_category
  has_many :resource_items
end
