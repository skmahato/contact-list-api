class ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render_success(:ok, contact)
    else
      render_error(:unprocessable_entity, contact.errors)
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render_success(:ok, contact)
    else
      render_error(:unprocessable_entity, contact.errors)
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render_success(:ok, contact)
    else
      render_error(:unprocessable_entity, contact.errors)
    end
  end

  private

  def contact_params
    params.permit(:name, :number)
  end
end
