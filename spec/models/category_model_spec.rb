require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    User.destroy_all
    Category.destroy_all

    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category, user: @user)
  end

  it 'has valid attributes' do
    expect(@category).to be_valid
  end

  it 'is invalid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is invalid with a name longer than 200 characters' do
    @category.name = 'c' * 201
    expect(@category).to_not be_valid
  end

  it 'is invalid without a user' do
    @category.user = nil
    expect(@category).to_not be_valid
  end
end
