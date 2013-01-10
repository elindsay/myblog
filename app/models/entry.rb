class Entry < ActiveRecord::Base
  attr_accessible :title, :body, :user

  belongs_to :user

  validates_presence_of :title
  validates_presence_of :user_id
end
