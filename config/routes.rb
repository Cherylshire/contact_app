Rails.application.routes.draw do
namespace :namespace do
  get '/first_contact_url' => 'contacts#first_contact_action'
  get '/all_contacts_url' => 'contacts#all_contact_action'
  end
end
