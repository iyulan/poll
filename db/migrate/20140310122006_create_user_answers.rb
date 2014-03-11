class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
    	t.integer :answer_id
    	t.string :user_ip
    	
      t.timestamps
    end
  end
end
