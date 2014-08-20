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

require 'rails_helper'

RSpec.describe Task, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
