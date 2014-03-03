class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.belongs_to :question_id

      t.timestamps
    end
  end
end
