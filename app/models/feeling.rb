class Feeling < ActiveRecord::Base
  attr_accessible :name, :header_feeling

  validates_uniqueness_of :name

  before_create :set_head
  has_many :related_feelings, class_name: 'Feeling', :foreign_key => 'header_feeling', :primary_key => 'name'

  scope :heads_only, where(head: true)

  def child_feelings
    self.related_feelings - [self]
  end

  private

  def set_head
    self.head = self.name == self.header_feeling
    self
  end
end
