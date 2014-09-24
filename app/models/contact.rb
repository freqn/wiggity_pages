class Contact < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates :name, presence: true
  has_many :phones

end
