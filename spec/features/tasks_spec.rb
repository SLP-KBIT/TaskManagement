require 'rails_helper'

RSpec.describe 'Task', type: :feature do
  before do
    FactoryGirl.create(:feature_task)
    FactoryGirl.create(:finished_task)
  end
  scenario 'view task list' do
    visit root_path

    expect(page).to have_content '新しいタスク'
    expect(page).to have_content 'タスク名'
  end
end
