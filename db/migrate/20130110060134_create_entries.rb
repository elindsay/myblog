class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
