class ContestGroup < ActiveRecord::Base
  has_many :contests, dependent: :destroy

  validates_presence_of :name
end
