class Namespace::ContactsController < ApplicationController
  def first_contact_action
    @contact = Contact.find(1)
    render 'first_contact_view.json.jb'
  end

  def all_contact_action
    @contacts = Contact.all
    render 'all_contacts_view.json.jb'
  end  
end
