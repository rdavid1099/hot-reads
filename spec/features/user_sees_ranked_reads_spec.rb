require 'rails_helper'

RSpec.describe 'user sees ranked reads' do
  it 'shows top ten read links' do
    create_reads(10)
    visit reader_index_path

    expect(page).to have_content('test0')
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
    expect(page).to have_content('test3')
  end
end
