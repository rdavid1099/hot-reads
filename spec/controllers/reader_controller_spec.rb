require 'rails_helper'

RSpec.describe 'reader controller' do
  before(:each) do
    @controller = Api::V1::ReaderController.new
  end
  it 'saves json of read info sent to it' do
    params = {
      title: 'test',
      url: 'http://www.test.com',
      submitter: 'tester'
    }

    post :create, params: params
    resp = JSON.parse(response.body)
    expect(resp['status']).to eq(201)
    expect(resp['message']).to eq('Successfully created read')
  end

  it 'sends error if bad info is sent' do
    params = {
      title: 'test',
      url: 'http://www.test.com'
    }

    post :create, params: params
    resp = JSON.parse(response.body)
    expect(resp['status']).to eq(400)
    expect(resp['message']).to eq('Read not saved')
  end

  it 'adds to the counter if the read is already in the database' do
    params = {
      title: 'test',
      url: 'http://www.test.com',
      submitter: 'tester'
    }
    read = Read.create({title: 'test',  url: 'http://www.test.com', submitter_name: 'tester'})
    post :create, params: params
    resp = JSON.parse(response.body)
    expect(resp['status']).to eq(202)
    expect(resp['message']).to eq('Successfully updated read')
    expect(Read.last.counter).to eq(2)
  end
end
