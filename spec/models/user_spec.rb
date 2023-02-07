require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'name' do
    it 'cannot be nil' do
      user.name = nil
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'cannot be blank' do
      user.name = ''
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'cannot be trivial' do
      user.name = 'a'
      expect(user).not_to be_valid
    end
  end

  describe 'password' do
    it 'cannot be nil' do
      user.password = nil
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/can't be blank/)
    end

    it 'must contain more than 11 characters' do
      user.password = 'aAbBdd8]t50'
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/is too short/)
    end
  end

  describe 'encrypted_password' do
    it 'does not store the password' do
      user.password = 'aBcd1234$%uiabD0'
      user.save
      expect(user.encrypted_password).not_to eq(user.password)
    end
  end
end
