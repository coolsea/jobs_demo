class Job < ActiveRecord::Base


  belongs_to :user
  belongs_to :category, :counter_cache => true

  scope :published,  -> { where(:is_published => true ) }
  scope :recent, -> { order("id DESC") }

  include Tokenable
  include ActionView::Helpers::TextHelper

  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :apply_instruction, :presence => true
  validates :url, :url => true, :allow_blank => true

  validates :email, :email => true

  validate :check_salary, fields: [:lower_bound, :higher_bound]


  def og_description
    content = []
    content << description if description.present?


    str = truncate(content.first, :length => 150 )

    ERB::Util.h(str)
  end

  def og_title
    ERB::Util.h("#{title} - #{company_name} - 最高薪水 #{higher_bound}")
  end

  def company_human_name
    if company_name.present?
      company_name
    else
       "（匿名）"
    end
  end


  def check_salary
    if lower_bound.blank?
      errors.add(:lower_bound, "最低薪水不能為空")
    end

    if higher_bound.blank?
      errors.add(:lower_bound, "最高薪水不能為空")
    end

    if lower_bound.to_i < 30000
      errors.add(:lower_bound, "最低薪不能低於 30000")
    end

    if higher_bound.to_i < 60000
      errors.add(:lower_bound, "最高薪要超過 66000")
    end

    if lower_bound.to_i > higher_bound.to_i
      errors.add(:lower_bound, "最高薪要能超過最低薪")
    end

  end

  def publish!
    self.is_published = true
    self.save
  end
end