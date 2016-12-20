require 'rails_helper'

RSpec.describe 'reader controller' do
  it 'saves json of read info sent to it' do
    @controller = Api::V1::ReaderController.new
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
    @controller = Api::V1::ReaderController.new
    params = {
      title: 'test',
      url: 'http://www.test.com'
    }

    post :create, params: params
    resp = JSON.parse(response.body)
    expect(resp['status']).to eq(400)
    expect(resp['message']).to eq('Read not saved')
  end

end
