class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true


  include Tokenable


  def publish!
    self.is_published = true
    self.save
  end
end