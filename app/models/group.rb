class Group < ApplicationRecord
  has_many  :group_contacts
  has_many  :contacts, through: :group_contact
  # has_many(:contacts, {through: :group_contact}) #through: is a "key", :group_contact is a value. It's a hash.
end
