require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(first_name: 'John', last_name: 'Doe'))
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "MyString",
      :person => @person
    ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_person_id[name=?]", "phone_number[person_id]"
    end
  end
end
