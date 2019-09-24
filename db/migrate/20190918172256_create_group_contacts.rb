class CreateGroupContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :group_contacts do |t|
      t.integer :group_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
