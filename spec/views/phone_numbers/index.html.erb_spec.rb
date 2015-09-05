require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "Number",
        :person => @person
      ),
      PhoneNumber.create!(
        :number => "Number",
        :person => @person
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
