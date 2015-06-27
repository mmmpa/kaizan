require 'rails_helper'

describe 'Samples', type: :request do
  before :each do
    get '/samples/index'
  end

  it 'not html_safe string, keep it' do
    expect(response.body).not_to have_tag('li.case1 xmp')
  end

  it 'alter with not string' do
    expect(response.body).to have_tag('li.case2', text: 'string')
  end

  it 'alter with not html_safe string' do
    expect(response.body).not_to have_tag('li.case3 xmp')
  end

  it 'alter with html_safe string' do
    expect(response.body).to have_tag('li.case4 strong')
  end

  it 'alter with named anchor' do
    expect(response.body).to have_tag('li.case7', text: 'Thank you', count: 1)
  end

  it 'alter with same named anchor' do
    expect(response.body).to have_tag('li', text: 'Multiple altering', count: 2)
  end

  it 'ignore anchor name not exist' do
    expect(response.body).not_to include('Not exist')
  end

  it 'SafeBuffer can concatenate after altering' do
    expect(response.body).to have_tag('footer', text: 'Concatenated', count: 1)
  end
end
