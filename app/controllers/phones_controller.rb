class PhonesController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    @phone = @contact.phones.new
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

  def edit
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    render 'phones/edit'
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    if @phone.update number: params[:number],
                      contact_id: params[:contact_id]

      render('phones/updated')
    else
      render('phones/edit')
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    @phone.destroy
    render('phones/destroy')
  end

end