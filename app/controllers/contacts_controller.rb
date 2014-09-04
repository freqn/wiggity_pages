class ContactsController < ApplicationController

def index
  @contacts = Contact.all
  render 'contacts/index'
end

end