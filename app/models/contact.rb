class Contact < ApplicationRecord
  validates_presence_of :name, :number
  validates_uniqueness_of :name, :number
end
