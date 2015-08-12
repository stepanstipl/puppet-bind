require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.default_facts = {
    :osfamily =>  'Debian',
    :operatingsystem => 'Debian',
    :lsbdistcodename => 'wheezy',
    :architecture => 'amd64',
    :kernel => 'Linux',
    :test_config => 'default'
  }
#  c.hiera_config = File.join('spec', 'fixtures', 'hiera', 'hiera.yaml')
end
