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
      expect(user.errors[:password].join(' ')).to match(/not be blank/)
    end

    it 'must contain more than 11 characters' do
      user.password = 'aAbBdd8]t50'
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/at least 12 characters/)
    end

    it 'must contain at least one uppercase letter' do
      user.password = 'a' * 12
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/at least 1 uppercase/)
    end

    it 'must contain at least one lowercase letter' do
      user.password = 'A' * 12
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/at least 1 lowercase/)
    end

    it 'must contain at least one digit' do
      user.password = 'aBcDefghiJkL'
      user.valid?
      expect(user.errors[:password].join(' ')).to match(/at least 1 digit/)
    end
  end

  describe 'password_digest' do
    it 'does not store the password' do
      user.password = 'aBcd1234$%uiabD0'
      user.save
      expect(user.password_digest).not_to eq(user.password)
    end
  end
end
