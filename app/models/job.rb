class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true

  scope :published,  -> { where(:is_published => true ) }

  include Tokenable

  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :company_name, :presence => true
  
  validates :url, :url => true
  
  validates :email, :email => true
  validate :check_salary, fields: [:lower_bound, :higher_bound]

  def check_salary
    if lower_bound.blank? 
      errors.add(:lower_bound, "最低薪水不能為空")
    end

    if higher_bound.blank?
      errors.add(:lower_bound, "最高薪水不能為空")
    end

    if lower_bound.to_i < 30000
      errors.add(:lower_bound, "最低薪不能超過 30000")
    end

    if lower_bound.to_i < 60000
      errors.add(:lower_bound, "最高薪要超過 66000")
    end

    if lower_bound > higher_bound
      errors.add(:lower_bound, "最高薪要能超過最低薪")
    end

  end

  def publish!
    self.is_published = true
    self.save
  end
end