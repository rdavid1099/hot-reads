class Read < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :submitter_name, presence: true

  def self.most_current
    self.all.where(updated_at: (Time.now - 24.hours)..Time.now).order(counter: :desc).limit(10)
  end
end
