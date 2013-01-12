class CreateNeedsAndFeelings < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :name
      t.string :header_need
      t.boolean :head
    end

    create_table :feelings do |t|
      t.string :name
      t.string :header_feeling
      t.boolean :head
    end
  end
end
