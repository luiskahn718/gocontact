require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "Address",
      :person => @person
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
  end
end
