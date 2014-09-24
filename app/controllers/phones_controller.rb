class PhonesController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    @phone = @contact.phones.new
    render 'new'
  end

  def create
    @phone = Phone.new number: params[:phone][:number],
                        contact_id: params[:contact_id]
    @contact = Contact.find(params[:contact_id])
    if @phone.save
      flash[:notice] = "Phone number added."
      redirect_to contact_path(@contact)
    else
      render('phones/new')
    end
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    render 'edit'
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    if @phone.update(phone_params)
      flash[:notice] = "Phone number updated."
      redirect_to contact_path(@contact)
    else
      render('phones/edit')
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    @phone.destroy
    flash[:notice] = "Phone number removed."
    redirect_to contact_path(@contact)
  end

  private

  def phone_params
    params.require(:phone).permit(:number)
  end

end
