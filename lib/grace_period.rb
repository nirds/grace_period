require "grace_period/version"

module GracePeriod
  class Installer
    def install
      Dir.mkdir("grace_periods")
      File.open("grace_periods/example_grace_period.yml", "w") do |file|

      file << "# Example expiration file \n"
      file << "# You can either put multiple grace_periods in this file or create a new file for each period. \n\n"
      file << "# expires_at:         Date.parse('Tue, 10 Aug 2016 01:20:19 -0500 (EDT)')\n"
      file << "# severity:           'warning'\n"
      file << "# display_message:    'The my_method method in thing.rb needs to be broken out.'\n"
      file << "# full_description:    >
                  # The my_method was made at the end of phase2 for this project with not enough time to
                  # do everything correctly. This very large method needs to be broken up into smaller
                  # more readable methods. When refactored correctly my_method will include just call a
                  # series of private methods.\n"
      end
    end
  end
end
