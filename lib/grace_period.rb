require "grace_period/version"
require 'contracts'

module GracePeriod
  class Installer
    def install
      Dir.mkdir("grace_periods")
      File.open("grace_periods/expiration_example.yml", "w") do |file|

      file << "This is going to the output file"
      end
    end
  end

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
