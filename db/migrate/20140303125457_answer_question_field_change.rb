class AnswerQuestionFieldChange < ActiveRecord::Migration
  def change
  	rename_column :answers, :question_id_id, :question_id
  end
end
