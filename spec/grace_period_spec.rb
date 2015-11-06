require 'spec_helper'

describe GracePeriod do
  it 'has a version number' do
    expect(GracePeriod::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it 'does bad stuff with Contracts' do
    client = GracePeriod::ContractClient.new
    expect { client.double('oops') }.to raise_error(ParamContractError)
  end

  it 'does good stuff with Contracts' do
    client = GracePeriod::ContractClient.new
    expect { client.double(1) }.to_not raise_error
  end

  it 'raises an error when time is in the past' do
    client = GracePeriod::ContractClient.new
    expect { client.future(-1000000)}.to raise_error(ParamContractError)
  end

  it "doesn't raise an error when time is in the future" do
   client = GracePeriod::ContractClient.new
   expect { client.future(1000000)}.to_not raise_error
  end

end
