require 'rails_helper'

RSpec.describe "As a user" do
  before(:each) do
    @potter = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
  end
  describe "when I visit the student index page" do
    it "lists each student's name, age, and house" do
      visit "/students"
      within("#student-section-#{@potter.id}") do
        expect(page).to have_content("Name: #{@potter.name}")
        expect(page).to have_content("Age: #{@potter.age}")
        expect(page).to have_content("House: #{@potter.house}")
      end
      within("#student-section-#{@malfoy.id}") do
        expect(page).to have_content("Name: #{@malfoy.name}")
        expect(page).to have_content("Age: #{@malfoy.age}")
        expect(page).to have_content("House: #{@malfoy.house}")
      end
      within("#student-section-#{@longbottom.id}") do
        expect(page).to have_content("Name: #{@longbottom.name}")
        expect(page).to have_content("Age: #{@longbottom.age}")
        expect(page).to have_content("House: #{@longbottom.house}")
      end
    end
  end
end