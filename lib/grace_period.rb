require "grace_period/version"
require 'contracts'

module GracePeriod

  class ContractClient
    include Contracts::Core
    include Contracts::Builtin

    Contract Num => Num
    def double(x)
      x * 2
    end
  end
end
