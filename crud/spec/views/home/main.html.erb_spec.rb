require 'rails_helper'

RSpec.describe 'home/main', type: :view do

  it 'renders the content successfully' do
    render
    assert_select 'h1', text: 'Who WE ARE'.to_s, count: 1
  end
end
