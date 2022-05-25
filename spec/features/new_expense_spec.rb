require 'rails_helper'

RSpec.describe 'New Expense Form', type: :feature do
  before(:all) do
    User.destroy_all
    Category.destroy_all
    @user = FactoryBot.create(:user)
    @category1 = FactoryBot.create(:category, user: @user)
  end

  before(:each) do
    visit(new_user_session_path)
    within 'form' do
      fill_in('user_email', with: @user.email)
      fill_in('user_password', with: 'secret')
    end
    click_button('Log in')
    visit(new_expense_path)
  end

  scenario('confirm that we are on the new expense form') do
    expect(page).to have_current_path(new_expense_path)
  end

  scenario 'confirm we have the correct fields' do
    expect(page).to have_field('expense_date_of_expense')
    expect(page).to have_field('expense_name')
    expect(page).to have_field('expense_amount')
    expect(page).to have_field('expense_categories')
  end

  scenario 'create a new expense' do
    within '.section-content form' do
      fill_in('expense_date_of_expense', with: '2022/05/10')
      fill_in('expense_name', with: 'light bills')
      fill_in('expense_amount', with: 10)
      select(@category1.name, from: 'expense_categories')
    end
    click_button('Add')
    expect(page).to have_current_path(category_path(@category1.id))
    expect(page).to have_content('New expense was successfully created.')
  end
end
