# frozen_string_literal: true

require 'spec_helper'

describe EmailContactsController do
  describe 'routing' do

    it 'recognizes and generates #index' do
      { get: '/email_contacts' }.should route_to(controller: 'email_contacts', action: 'index')
    end

    it 'recognizes and generates #new' do
      { get: '/email_contacts/new' }.should route_to(controller: 'email_contacts', action: 'new')
    end

    it 'recognizes and generates #show' do
      { get: '/email_contacts/1' }.should route_to(controller: 'email_contacts', action: 'show', id: '1')
    end

    it 'recognizes and generates #edit' do
      { get: '/email_contacts/1/edit' }.should route_to(controller: 'email_contacts', action: 'edit', id: '1')
    end

    it 'recognizes and generates #create' do
      { post: '/email_contacts' }.should route_to(controller: 'email_contacts', action: 'create')
    end

    it 'recognizes and generates #update' do
      { put: '/email_contacts/1' }.should route_to(controller: 'email_contacts', action: 'update', id: '1')
    end

    it 'recognizes and generates #destroy' do
      { delete: '/email_contacts/1' }.should route_to(controller: 'email_contacts', action: 'destroy', id: '1')
    end

  end
end
