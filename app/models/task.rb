# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :text
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#  finished   :boolean          default(FALSE)
#

class Task < ActiveRecord::Base
  default_scope { order(:id) }
  scope :unfinished, -> { where(finished: false) }
end
