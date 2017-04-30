# frozen_string_literal: true

class EmailContactsController < ApplicationController
  def index
    if admin_signed_in?
      @email_contacts = EmailContact.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render xml: @email_contacts }
      end
    else
      redirect_to root_path
    end
  end

  def show
    # TODO: add authorization here.  This should be redundant,
    # an unauthorized user should never get here.
    if admin_signed_in?
      @email_contact = EmailContact.find(params[:id])
      respond_to do |format|
        format.html
        format.xml { render xml: @email_contact }
      end
    else
      redirect_to root_path
    end
  end

  def new
    @email_contact = EmailContact.new

    respond_to do |format|
      format.html
      format.xml { render xml: @email_contact }
    end
  end

  def edit
    redirect_to email_contacts_path
    # @email_contact = EmailContact.find(params[:id])
  end

  def create
    @email_contact = EmailContact.new(params[:email_contact])

    respond_to do |format|
      if @email_contact.save
        deliver
        # format.html { redirect_to(thankyou_path, :notice => 'Email contact was successfully created.') }
        format.html { redirect_to thankyou_path } # { redirect_to(thankyou_path, :notice => 'Email contact was successfully created.') }
        format.xml  { render xml: @email_contact, status: :created, location: @email_contact }

      # redirect_to thankyou_path

      else
        format.html { render action: 'new' }
        format.xml  { render xml: @email_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @email_contact = EmailContact.find(params[:id])

    respond_to do |format|
      if @email_contact.update_attributes(params[:email_contact])
        format.html { redirect_to(@email_contact, notice: 'Email contact was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @email_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def thankyou
    @thanks = 'Come back soon!'
    render('email_contacts/thankyou')
  end

  # TODO: Add authentication so users not signed
  #       cannot delete.
  def destroy
    @email_contact = EmailContact.find(params[:id])
    @email_contact.destroy

    respond_to do |format|
      format.html { redirect_to(email_contacts_url) }
      format.xml  { head :ok }
    end
  end

  private

  def deliver
    # ContactMailer.welcome_email(@email_contact).deliver
    ContactMailer.contacts_copy(@email_contact).deliver
    ContactMailer.daves_copy(@email_contact).deliver
  end
end
