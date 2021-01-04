require 'rails_helper'

RSpec.describe "As a user" do
  describe "when I visit a user's show page" do
    before(:each) do
      @potter = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @herbology = Course.create(name: "Herbology")
      @potions = Course.create(name: "Potions")
      @dark_arts = Course.create(name: "Dark Arts")

      StudentCourse.create(student_id: @potter.id, course_id: @herbology.id)
      StudentCourse.create(student_id: @potter.id, course_id: @potions.id)
      StudentCourse.create(student_id: @potter.id, course_id: @dark_arts.id)
    end
    it "lists all the student's courses" do
      visit "/students/#{ @potter.id }"

      expect(page).to have_content(@potter.name)
      expect(page).to have_content(@herbology.name)
      expect(page).to have_content(@potions.name)
      expect(page).to have_content(@dark_arts.name)
    end
  end
end