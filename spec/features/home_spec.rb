require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  scenario 'Navber' do
    visit '/'
  end
end
