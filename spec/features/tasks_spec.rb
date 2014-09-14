require 'rails_helper'
require 'faker'

RSpec.describe 'Task', type: :feature, js: true do
  before do
    @feature  = FactoryGirl.create(:feature_task)
    @finished = FactoryGirl.create(:finished_task)
  end

  scenario '一覧の表示' do
    visit root_path
    expect_on_index_page
  end

  scenario '完了済みタスクの表示' do
    visit root_path
    click_on '完了済み'
    expect_on_index_page
  end

  scenario 'タスクの追加' do
    visit root_path
    click_on '新しいタスク'

    expect(page).to have_content 'タスクの新規作成'

    expect {
      fill_in 'タイトル', with: Faker::Lorem.sentence
      fill_in '詳細', with: Faker::Lorem.paragraph
      click_on '作成'
    }.to change(Task, :count).by(1)
  end

  scenario 'タスクの更新' do
    visit tasks_path
    click_on @feature.title

    page.save_screenshot('tmp/on_top.png', full: true)

    click_on '編集'
    expect_on_edit_page

    title = 'updated task title'
    detail = 'updated task detail'
    within(:xpath, '//form') do
      fill_in 'タイトル', with: title
      fill_in '詳細', with: detail
      click_on '更新'
    end

    visit task_path(@feature)
    expect(find('h2')).to have_content(title)
    expect(find('.panel-body')).to have_content(detail)
  end

  scenario 'タスクの削除' do
    visit tasks_path
    click_on @feature.title

    expect {
      click_on '削除'
    }.to change(Task, :count).by(-1)
  end

  def expect_on_index_page
    expect(page).to have_content '新しいタスク'
    expect(page).to have_content 'タスク名'
  end

  def expect_on_show_page
    expect(page).to have_content '編集'
    expect(page).to have_content '削除'
    expect(page).to have_content @feature.title
    expect(page).to have_content @feature.detail
  end

  def expect_on_edit_page
    expect(page).to have_content "タスクの更新"
    expect(page).to have_button "更新"
  end

end
