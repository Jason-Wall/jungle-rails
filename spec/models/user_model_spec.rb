require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.User' do
      it 'Create saves a user to the db' do
        user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@test.com',
          password: 'tests',
          password_confirmation: 'tests'
        )
        expect(User.count).to eq(1)
      end


      it 'Error if passwords do not match a user to the db' do
        user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@test.com',
          password: 'tests',
          password_confirmation: 'not the right password'
        )
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
        expect(User.count).to eq(0)
      end

      it 'Error if an email already exists in the db, not case sensitive' do
        user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@TEST.com',
          password: 'tests',
          password_confirmation: 'tests'
        )
        newuser = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@test.com',
          password: 'tests',
          password_confirmation: 'tests'
        )
        expect(newuser.errors.full_messages).to include("Email has already been taken")
        expect(User.count).to eq(1)
      end

      it 'Error if password is less than 4 characters' do
        user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'test@test.com',
          password: 'tes',
          password_confirmation: 'tes'
        )
        expect(user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
        expect(User.count).to eq(0)
      end
    end
  end