class ContactsController < ApplicationController

def index
  @contacts = Contact.all
end

def new
  @contact = Contact.new
end

def create
  @contact = Contact.new name: params[:contact][:name],
                          email: params[:contact][:email],
                            phone: params[:contact][:phone]
  if @contact.save
    flash[:notice] = "#{@contact.name} added."
    redirect_to contacts_path
  else
    render 'new'
  end
end

def edit
  @contact = Contact.find(params[:id])
end

def update
  @contact = Contact.find(params[:id])
  if @contact.update name: params[:contact][:name],
                      email: params[:contact][:email],
                        phone: params[:contact][:phone]
    flash[:notice] = 'Contact updated.'
    redirect_to contact_path(@contact)
  else
    render 'edit'
  end
end

def show
  @contact = Contact.find(params[:id])
end

def destroy
  @contact = Contact.find(params[:id])
  @person = @contact.name
  @contact.destroy
  flash[:notice] = "#{@person} was removed"
  redirect_to contacts_path
end



end
