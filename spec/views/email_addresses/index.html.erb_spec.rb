require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    assign(:email_addresses, [
      EmailAddress.create!(
        :address => "Address",
        :person => @person
      ),
      EmailAddress.create!(
        :address => "Address",
        :person => @person
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
