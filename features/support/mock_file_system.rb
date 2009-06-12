$LOAD_PATH << File.join(TOPDIR, "lib", "mockfs-0.1.6", "lib")
require "mockfs/override"

module MockFS

  @@mock_files = []

  def self.mock?; @@mock && matches_mock_files; end

  def self.mock_files=(glob)
    @@mock_files = glob
  end

  def self.matches_mock_files
    files = caller.map{|e| e.split(":").first }
    result = @@mock_files.any? do |mock_file|
      files.detect {|file| file =~ /#{Regexp.escape(mock_file)}/ }
    end
    result
  end

  class FileUtilsAdapter
    def self.mkdir_p(path)
      mkpath(path)
    end
  end
  
  class FileAdapter
    def self.expand_path(file_name, dir_string='')
      $expand_path_method.call(file_name, dir_string)
    end

    def self.stat(path)
      stats = Struct.new(:uid, :gid, :mode)
      stats.new(500, 500, 0755)
    end
  end
end

MockFS.mock_files = %w[lib/chef/provider/directory features/step_definitions/directory_steps]
