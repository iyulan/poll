class QuestionManyAnswerFieldAdd < ActiveRecord::Migration
  def change
  	add_column :questions, :many_answers, :boolean, default: false
  end
end
