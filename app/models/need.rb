class Need < ActiveRecord::Base
  attr_accessible :name, :header_need

  validates_uniqueness_of :name

  before_create :set_head
  has_many :related_needs, class_name: 'Need', :foreign_key => 'header_need', :primary_key => 'name'

  scope :heads_only, where(head: true)

  def child_needs
    self.related_needs - [self]
  end

  private

  def set_head
    self.head = self.name == self.header_need
    self
  end
end
