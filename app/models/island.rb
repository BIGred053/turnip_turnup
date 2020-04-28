class Island < ApplicationRecord
  alias_attribute :owner, :user
  belongs_to :user, class_name: 'User', foreign_key: :owner
end
