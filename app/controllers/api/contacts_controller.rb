class Api::ContactsController < ApplicationController
  def index
    first_name_search = params[:first_name]
    middle_name_search = params[:middle_name]
    last_name_search = params[:last_name]
    email_search = params[:email]
    group_filter = params[:group]

    search_term = params[:serach]

    if current_user && group_filter
      group = Group.find_by(name: group_filter)
      @contacts = group.contacts.where(user_id: current_user.id)
    elsif current_user
      @contacts = current_user.contacts
    else
      @contacts = Contact.all
    end
    
    if  first_name_search
      @contacts = @contacts.where(
                                  "first_name iLIKE ?",
                                  "%#{first_name_search}%"
                                  )
    end

    if middle_name_search
      @contacts = @contacts.where(
                                  "middle_name iLIKE ?",
                                  "%#{middle_name_search}%"
                                  )
    end

    if last_name_search
      @contacts = @contacts.where(
                                  "last_name iLIKE ?",
                                  "%#{last_name_search}%"
                                  )
    end

    if email_search
      @contacts = @contacts.where(
                                  "email iLIKE ?",
                                  "%#{email_search}%"
                                  )
    end

    if search_term
      @contacts = @contacts.where(
                                  "first_name iLIKE ? OR middle_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ?",
                                  "%#{search_term}%",
                                  "%#{search_term}%",
                                  "%#{search_term}%",
                                  "%#{search_term}%"
                                  )
    end                                
    @contacts = Contact.all


    render 'index.json.jb'
  end

  def create
    @contact = Contact.new(
                          id: params[:id],
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          full_name: params[:full_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          address: params[:address],
                          bio: params[:bio],
                          formatted: {
                                     friendly_updated_at: params[:friendly_updated_at]
                                      },
                          group: params[:group]
                          )
    @contact.save
    render 'show.json.jb'
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @contact = Contact.find(params[:id])
    
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.address = params[:address] || @contact.address
    @contact.group = params[:group] || @contact.group

    @contact.save
    render 'show.json.jb'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @recive.destroy
    render json:{message: "Successfully Destroy!"}
  end
end
