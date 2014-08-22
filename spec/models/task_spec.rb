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
require 'spec_helper'

RSpec.describe Task, :type => :model do
  before do
    FactoryGirl.create(:feature_task)
    FactoryGirl.create(:finished_task)
  end
  describe '.finished' do
    it { expect(Task.finished.pluck(:finished).uniq).to eq([true]) }
  end
  describe '.unfinished' do
    it { expect(Task.unfinished.pluck(:finished).uniq).to eq([false]) }
  end
end
