require 'spec_helper'

describe 'Samples', type: :request do
  describe do
    it do
      get '/samples/index'
      response.status.should == 200
    end
  end
end