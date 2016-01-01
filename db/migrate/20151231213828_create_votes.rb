class CreateVotes < ActiveRecord::Migration
  def change
    create_table   :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.references :user, null: false
      t.integer    :value, null: false

      t.timestamps
    end
  end
end
