class NvcTriggerJournalEntry < ActiveRecord::Base
  attr_accessible :trigger_object,
    :my_feelings,
    :my_needs,
    :my_request,
    :her_his_feelings,
    :her_his_needs,
    :my_amended_request,
    :user

  belongs_to :user

  validates_presence_of :user_id

end
