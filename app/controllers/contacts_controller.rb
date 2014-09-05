class ContactsController < ApplicationController

def index
  @contacts = Contact.all
  render 'contacts/index'
end

def new
  @contact = Contact.new(params[:contact])
  render 'contacts/new'
end

def create
  @contact = Contact.new(params[:contact])
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

def update
  @contact = Contact.find(params[:id])
  if @contact.update name: params[:name],
                      email: params[:email],
                        phone: params[:phone]
    render 'contacts/success'
  else
    render 'contacts/edit'
  end
end

def show
  @contact = Contact.find(params[:id])
  render 'contacts/show'
end

def destroy
  @contact = Contact.find(params[:id])
  @contact.destroy
  render 'contacts/destroy'
end



end