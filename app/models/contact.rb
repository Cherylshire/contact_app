class Contact < ApplicationRecord
  belongs_to           :user
  has_many             :group_contacts
  has_many             :groups, through: :group_contacts


  validates            :first_name,   presence: true
  validates            :first_name,   length: {in: 1..120}
  validates            :middle_name,  presence: true
  validates            :middle_name,  length: {in: 0..120}
  validates            :last_name,    presence: true
  validates            :last_name,    length: {in: 1..120}
  validates            :email,        presence: true
  validates            :email,        uniqueness: true
  validates_format_of  :email,        with: /\A(\w|[.])+[@]\w{3,}[.]\w{2,20}\z/i
  # validates :email, numericality, @, letters

  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
