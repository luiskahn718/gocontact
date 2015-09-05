require 'rails_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create!(first_name: 'John', last_name: 'Doe') }

  describe "phone_numbers" do
    before(:each) do
      person.phone_numbers.create(number: '555-1234')
      person.phone_numbers.create(number: '555-9876')
      visit person_path(person)
    end

    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has a link to add phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
    end

    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-1234')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-1234')
    end

    it 'has links to edit phone number' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-4321')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-4321')
      expect(page).to_not have_content(old_number)
    end

    it 'has link to delete phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone))
      end
    end

    it 'deletes a phone number' do
      phone = person.phone_numbers.first
      first_link = first(:link, 'delete')
      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content(phone.number)
      expect(page).to_not have_link(first_link)
    end
  end

  describe "email_addresses" do
    before(:each) do
      person.email_addresses.create(address: 'test1@example.com')
      person.email_addresses.create(address: 'test2@example.com')
      visit(person_path(person))
    end

    it 'shows the email addresses' do
      person.email_addresses.each do |email|
        expect(page).to have_selector('li', email.address)
      end
    end

    it 'has a link to add email address' do
      expect(page).to have_link('Add email address', new_email_address_path)
    end

    it 'adds a new email address' do
      page.click_link('Add email address')
      page.fill_in('Address', with: 'test@example.com')
      page.click_button('Create Email address')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('test@example.com')
    end

    it 'has link to edit an email address' do
      person.email_addresses.each do |email|
        expect(page).to have_link('edit', edit_email_address_path(email))
      end
    end

    it 'edits an email address' do
      email = person.email_addresses.first
      first(:link, 'edit').click
      page.fill_in('Address', with: 'test2@example.com')
      page.click_button('Update Email address')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('test2@example.com')
      expect(page).to_not have_content(email.address)
    end

    it 'has link to delete an email address' do
      person.email_addresses.each do |email|
        expect(page).to have_link('delete', email_address_path(email, method: :delete))
      end
    end

    it 'deletes an email address' do
      email = person.email_addresses.first
      first(:link, 'delete').click
      expect(current_path).to eq(person_path(person))
      expect(page).to_not have_content(email.address)
    end

  end
end
