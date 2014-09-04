class ContactsController < ApplicationController

def index
  @contacts = Contact.all
  render 'contacts/index'
end

def new
  @contact = Contact.new
  render 'contacts/new'
end

def create
  @contact = Contact.new name: params[:name],
                            email: params[:email],
                            phone: params[:phone]
  if @contact.save
    render 'contacts/success'
  else
    render 'contacts/new'
  end
end

def edit
  @contact = Contact.find(params[:id])
  render 'contacts/edit'
end

def show
  @contact = Contact.find(params[:id])
  render 'contacts/show'
end



end