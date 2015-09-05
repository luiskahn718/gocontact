require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "Number",
      :person => @person
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(//)
  end
end
