require 'spec_helper'

describe 'ansible-haproxy::default' do

  describe package('haproxy') do
    it { should be_installed.by('apt') }
  end
end
