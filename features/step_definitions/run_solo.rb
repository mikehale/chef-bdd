require 'json'

When /^I run chef-solo with the '(.+)' recipe$/ do |recipe_name|
  # Dir.stub!(:mkdir)
  # File.stub!(:exist?).and_return(true)
  # File.stub!(:directory?).and_return(true)
  # cstats = mock("stats", :null_object => true)
  # cstats.stub!(:uid).and_return(500)
  # cstats.stub!(:gid).and_return(500)
  # cstats.stub!(:mode).and_return(0755)
  # File.stub!(:stat).once.and_return(cstats)

  Chef::Config[:log_location] = '/dev/null'
  Chef::Config[:log_level] = :error
  Chef::Config[:cookbook_path] = File.join(TOPDIR, 'data', 'cookbooks')
  Chef::Config[:file_cache_path] = File.join(TOPDIR, 'data', 'cache')
  Chef::Log.level(Chef::Config[:log_level])

  dna = {"recipes" => [recipe_name], "platform" => "ubuntu", "platform_version" => '9.0.4' }
  @chef_solo = Chef::Client.new
  @chef_solo.json_attribs = dna
  @chef_solo.node_name = "latte"
  @chef_solo.run_solo
end

# This is kind of a crazy-ass setup, but it works.
# When /^I run chef-solo with the '(.+)' recipe$/ do |recipe_name|
#   # Set up the JSON file with the recipe we want to run.
#   dna_file = "#{tmpdir}/chef-solo-features-dna.json"
#   File.open(dna_file, "w") do |fp|
#     fp.write("{ \"recipes\": [\"#{recipe_name}\"] }")
#   end
# 
#   cleanup_files << "#{tmpdir}/chef-solo-features-dna.json"
# 
#   # Set up the cache dir.
#   cache_dir = "#{tmpdir}/chef-solo-cache-features"
#   system("mkdir -p #{cache_dir}")
#   cleanup_dirs << cache_dir 
# 
#   # Cookbook dir
#   cookbook_dir ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'data', 'cookbooks'))
#   system("cp -r #{cookbook_dir} #{cache_dir}")
# 
#   # Config file
#   config_file = "#{tmpdir}/chef-solo-config-features.rb"
#   File.open(config_file, "w") do |fp|
#     fp.write("cookbook_path \"#{cache_dir}/cookbooks\"\n")
#     fp.write("file_cache_path \"#{cache_dir}/cookbooks\"\n")
#   end
#   cleanup_files << config_file
# 
#   binary_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'chef', 'bin', 'chef-solo'))
#   command = "chef-solo -c #{config_file} -j #{dna_file}"
#   command += " -l debug" if ENV['LOG_LEVEL'] == 'debug'
# 
#   # Run it
#   puts "Running solo: #{command}" if ENV['LOG_LEVEL'] == 'debug'
# 
#   status = Chef::Mixin::Command.popen4(command) do |p, i, o, e|
#     @stdout = o.gets(nil)
#     @stderr = o.gets(nil)
#   end
#   @status = status
# 
#   print_output if ENV['LOG_LEVEL'] == 'debug'
# end
