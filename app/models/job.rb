class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true

  scope :published,  -> { where(:is_published => true ) }

  include Tokenable

  validates :title, :presence => true

  validates :lower_bound, presence: true
  #validates :higher_bound, presence: true

  def publish!
    self.is_published = true
    self.save
  end
end