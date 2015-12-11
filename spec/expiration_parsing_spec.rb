require 'spec_helper'
require 'yaml'

def loaded_yml_data
  name = File.join(__dir__, 'fixtures/example_grace_period.yml')
  YAML.load(ERB.new(File.read(name)).result)
end

describe GracePeriod do
  it 'loads and evaluates a sample expiration file' do
    expires_at = loaded_yml_data['expiration']['expires_at']
    expect(expires_at).to eq('Tue, 10 Aug 2016 01:20:19 -0500 (EDT)')
  end

  it 'gets all of the values from the file' do
    severity = loaded_yml_data['expiration']['severity']
    expect(severity).to eq('warning')

    display_message = loaded_yml_data['expiration']['display_message']
    expect(display_message).to eq('The my_method method in thing.rb needs to be broken out.')

    full_description = loaded_yml_data['expiration']['full_description']
    expect(full_description).to eq('This is a really long string. Really.')
  end
end
