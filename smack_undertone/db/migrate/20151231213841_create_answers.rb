class CreateAnswers < ActiveRecord::Migration
  def change
    create_table   :answers do |t|
      t.references :author, null: false
      t.references :question, null: false
      t.string     :content, null: false
      t.boolean    :is_best, default: false

      t.timestamps
    end
  end
end
