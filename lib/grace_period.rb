require "grace_period/version"
require 'contracts'

module GracePeriod

  class ContractClient
    include Contracts::Core
    include Contracts::Builtin

    Contract lambda { |x| x.is_a? Numeric } => Num
    def double(x)
      x * 2
    end

    Contract  Num  => Pos
    def future(x)
      x - Time.now.to_i
    end
  end
end
