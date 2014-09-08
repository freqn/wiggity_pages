class PhonesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @phone = contact.phones.new
    render('phones/new')
  end

  def create
    @phone = Phone.new number: params[:number],
                        contact_id: params[:contact_id]
    @contact = Contact.find(params[:contact_id])
    if @phone.save
      render('phones/success')
    else
      render('phones/new')
    end 
  end
end