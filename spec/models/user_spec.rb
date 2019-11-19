require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      User.new(
        name: "yeet", 
        email: "yoight@im.bby", 
        password: "yeet", 
        password_confirmation: "yeet"
      )
    end

    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid with no name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid with no email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if password and password confirmation don match' do
      subject.password_confirmation = "yote"
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    user1 = User.create(
      name: "yeet", 
      email: "bby@im.bby", 
      password: "yeet", 
      password_confirmation: "yeet"
    )

    it 'should not be valid if email already exists' do
      @me = User.new(
        name: "yeet", 
        email: "bby@im.bby", 
        password: "yeet", 
        password_confirmation: "yeet"
      )
      expect(@me).to_not be_valid
    end
  end

end
