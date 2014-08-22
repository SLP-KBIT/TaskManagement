FactoryGirl.define do
  factory :feature_task, class: Task do
    title '新機能の追加'
    detail 'システムに必須の新機能を実装する｡'
  end
end


FactoryGirl.define do
  factory :finished_task, class: Task do
    title '完了済みタスク'
    detail '完了済みタスクの内容'
    finished true
  end
end
