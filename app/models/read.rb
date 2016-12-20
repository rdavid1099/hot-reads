class Read < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :submitter_name, presence: true
end
