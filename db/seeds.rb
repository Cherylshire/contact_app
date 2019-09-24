# count = 1

# 2000.times do 
#   generated_first_name = Faker::Name.first_name
#   generated_last_name = Faker::Name.last_name

#   contact = Contact.new(
#                         first_name: generated_first_name,
#                         last_name: generated_last_name,
#                         email: Faker::Internet.free_email(name: "#{generated_first_name}.#{generated_last_name}"),
#                         address: Faker::Address.city
#                         )

#   contact.save
#   puts "#{count} - #{generated_first_name} #{generated_last_name}"
#   count += 1
# end

# contacts = Contact.all

# contacts.each do |contact|
#   contact.middle_name = #???
#   contact.save
# end

# group_kinds =["friends", "family", "business", "Chicago", "El Paso", "Austin", "speed dial"]

# group_kinds.each do |group_kind|
#   Group.create(kind: group_kind)
# end

group_ids = Group.pluck(:id)

Contact.all.each do |contact|
  selected_group_ids = group_ids.sample(rand(2..5))
  selected_group_ids.each do |selected_group_id|
    GroupContact.create(contact_id: contact.id, group_id: selected_group_id)
    puts "Contact: #{contact.id}, Group: #{selected_group_id}."
  end
end