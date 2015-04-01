require 'spec_helper'
describe 'zayutils' do

  context 'with defaults for all parameters' do
    it { should contain_class('zayutils') }
  end
end
