class Sale < ApplicationRecord
  belongs_to :island
  alias_attribute :owner, :user
  has_many :sales_users
end
