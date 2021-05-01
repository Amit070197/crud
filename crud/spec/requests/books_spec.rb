require 'rails_helper'

# Rspec.describe 'Book',type: :request do

RSpec.describe '/books', type: :request do

current_user = User.first_or_create!(email: 'aspk@gmail.com', password: 'password', password_confirmation: 'password')

let(:valid_attributes) do
{
      'user_id' =>'1',
      'address' => 'address',
      'contact_number' => 1234567890,
      'age' => 12,
      'email' => 'aspk@gmail.com',
}
end


let(:invalid_attributes) do
    {
        'user_id' =>'a',
        'address' => '',
        'contact_number' => '',
        'age' => 'age',
        'email' => 'aspk@gmail',     
    }
    end


    describe "GET /index" do
        it "renders successful response" do
            book=Book.new(valid_attributes)
            book.user=current_user
            book.save
            get books_url
            expect(response).to be_succesful
        end
    end    
    
    describe "GET /show" do
        it "renders successful response" do
            book=Book.new(valid_attributes)
            book.user=current_user
            book.save
            get books_url(book)
            expect(response).to be_succesful
        end
    end      


   describe "GET /new" do
        it "renders successful response" do
            get new_book_url
            get book_url(book)
            expect(response).to be_succesful
        end
    end 

    describe "GET /edit" do
        it "renders successful response" do
            book=Book.new(valid_attributes)
            book.user=current_user
            book.save
            get edit_book_url(book)
            expect(response).to be_succesful
        end
    end      
end