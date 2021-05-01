require 'rails_helper'

RSpec.describe Book, type: :model do

  current_user = User.first_or_create!(email: 'aspk@gmail.com', password: '123456', password_confirmation: '123456')
  it 'has an invalid input' do
    book = Book.new(
      address: '',
      contact_number: 123,
      age: 0,
      email: '',
    )
    expect(book).not_to be_valid
  end

  
  it 'has an valid input' do
    book = Book.new(
      address: 'address',
      contact_number: 1234567890,
      age: 12,
      email: 'aspk@gmail.com',
      user_id: current_user.id
    )
    expect(book).to be_valid
  end

end

