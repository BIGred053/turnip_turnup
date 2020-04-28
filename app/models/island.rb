class Island < ApplicationRecord
  alias_attribute :owner, :user
  belongs_to :user
end
