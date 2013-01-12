class CreateNvcTriggerJournalEntry < ActiveRecord::Migration
  def change
    create_table :nvc_trigger_journal_entries do |t|
      t.belongs_to :user
      t.text :trigger_object
      t.text :my_feelings
      t.text :my_needs
      t.text :my_request
      t.text :her_his_feelings
      t.text :her_his_needs
      t.text :my_amended_request
      t.timestamps
    end
  end
end
