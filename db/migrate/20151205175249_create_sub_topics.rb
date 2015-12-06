class CreateSubTopics < ActiveRecord::Migration
  def change
    create_table :sub_topics do |t|
      t.string :name
      t.string :description
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
