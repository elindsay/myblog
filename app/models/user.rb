class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :password

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :entries

  def self.authenticate(name, password)
    find_by_name(name).try(:authenticate, password)
  end
end
