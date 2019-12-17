require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is created with a password field" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(@user.password_digest).to be_present
    end

    it "is created with a password_confirmation field" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(@user.password_confirmation).to be_present
    end

    it "is not valid without a first name" do
      @user = User.new(
        first_name: nil, 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user = User.new(
        first_name: "John", 
        last_name: nil, 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end

    it "is not valid without a email" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: nil, 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(@user).to_not be_valid
    end

    it "is email must be unique and not case sensitive" do
      
      user = User.create(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "654321")
      user1 =  User.create(
        first_name: "Marry", 
        last_name: "Kvint", 
        email: "DOE@GMAIL.COM", 
        password_digest: "123456", 
        password_confirmation: "123456")
      expect(user1).to_not be_valid
    end

    it "is password and password_confirmation fields is not the same" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123456", 
        password_confirmation: "654321")
      expect(@user.password_digest).not_to eq(@user.password_confirmation)
    end

    it "is not when password min length is less then 5" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "123", 
        password_confirmation: "123")
        expect(@user).to_not be_valid
    end

    it "is password min length is 5" do
      @user = User.new(
        first_name: "John", 
        last_name: "Doe", 
        email: "doe@gmail.com", 
        password_digest: "12345", 
        password_confirmation: "12345")
        expect(@user).to be_valid
    end

  end

end
