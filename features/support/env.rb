# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'
require 'tmpdir'
require 'chef'
require 'chef/config'
require 'chef/client'

module ChefWorld

  attr_accessor :recipe, :cookbook, :response, :inflated_response, :log_level, :chef_args, :config_file, :stdout, :stderr, :status, :exception

  def client
    @client ||= Chef::Client.new
  end

  def tmpdir
    @tmpdir ||= File.join(Dir.tmpdir, "chef_integration")
  end
  
  def datadir
    @datadir ||= File.join(File.dirname(__FILE__), "..", "data")
  end

  def cleanup_files
    @cleanup_files ||= Array.new
  end

  def cleanup_dirs
    @cleanup_dirs ||= Array.new
  end

  def stash
    @stash ||= Hash.new
  end
  
end

World(ChefWorld)


After do
  cleanup_files.each do |file|
    system("rm #{file}")
  end
  cleanup_dirs.each do |dir|
    system("rm -rf #{dir}")
  end
  # cj = Chef::REST::CookieJar.instance
  # cj.keys.each do |key|
  #   cj.delete(key)
  # end
  data_tmp = File.join(File.dirname(__FILE__), "..", "data", "tmp")
  system("rm -rf #{data_tmp}/*")
end
