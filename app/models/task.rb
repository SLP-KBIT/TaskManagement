# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :text
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
end
