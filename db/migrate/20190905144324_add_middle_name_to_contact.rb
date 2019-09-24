class AddMiddleNameToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :middle_name, :string
    add_column :contacts, :phone_number, :string
  end
end

# add_column is the method.
# :contacts is the table.
# :Middle_name is an attribute.
# :string is the data.