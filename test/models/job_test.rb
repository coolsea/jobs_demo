# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  company_name :string(255)
#  url          :string(255)
#  email        :string(255)
#  category_id  :integer          default(1)
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
