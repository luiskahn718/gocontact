require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyString",
      :person => @person
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "input#email_address_address[name=?]", "email_address[address]"

      assert_select "input#email_address_person_id[name=?]", "email_address[person_id]"
    end
  end
end
