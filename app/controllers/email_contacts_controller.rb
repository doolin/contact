class EmailContactsController < ApplicationController

  # GET /email_contacts
  # GET /email_contacts.xml
  def index
    @email_contacts = EmailContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @email_contacts }
    end
  end

  # GET /email_contacts/1
  # GET /email_contacts/1.xml
  def show
    @email_contact = EmailContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email_contact }
    end
  end

  # GET /email_contacts/new
  # GET /email_contacts/new.xml
  def new
    @email_contact = EmailContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email_contact }
    end
  end

  # GET /email_contacts/1/edit
  def edit
    @email_contact = EmailContact.find(params[:id])
  end

  # POST /email_contacts
  # POST /email_contacts.xml
  def create
    @email_contact = EmailContact.new(params[:email_contact])

    respond_to do |format|
      if @email_contact.save
        ContactMailer.welcome_email(@email_contact).deliver
        format.html { redirect_to(thankyou_path, :notice => 'Email contact was successfully created.') }
        format.xml  { render :xml => @email_contact, :status => :created, :location => @email_contact }

	#redirect_to thankyou_path

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /email_contacts/1
  # PUT /email_contacts/1.xml
  def update
    @email_contact = EmailContact.find(params[:id])

    respond_to do |format|
      if @email_contact.update_attributes(params[:email_contact])
        format.html { redirect_to(@email_contact, :notice => 'Email contact was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email_contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /email_contacts/1
  # DELETE /email_contacts/1.xml
  def destroy
    @email_contact = EmailContact.find(params[:id])
    @email_contact.destroy

    respond_to do |format|
      format.html { redirect_to(email_contacts_url) }
      format.xml  { head :ok }
    end
  end
end
