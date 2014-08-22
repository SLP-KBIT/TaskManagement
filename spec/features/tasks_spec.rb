require 'rails_helper'
require 'faker'

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

  scenario 'view finished task list' do
    visit root_path

    click_on '完了済み'

    expect(page).to have_content '新しいタスク'
    expect(page).to have_content 'タスク名'
  end

  scenario 'add new task' do
    visit root_path
    click_on '新しいタスク'

    expect(page).to have_content 'タスクの新規作成'

    expect {
      fill_in 'タイトル', with: Faker::Lorem.sentence
      fill_in '詳細', with: Faker::Lorem.paragraph
      click_on '作成'
    }.to change(Task, :count).by(1)
  end
end
