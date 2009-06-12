require 'json'

When /^I run chef-solo with the '(.+)' recipe$/ do |recipe_name|
  # Chef::Config[:log_location] = '/dev/null'
  Chef::Config[:log_level] = :fatal
  Chef::Config[:cookbook_path] = File.join(TOPDIR, 'data', 'cookbooks')
  Chef::Config[:file_cache_path] = File.join(TOPDIR, 'data', 'cache')
  Chef::Log.level(Chef::Config[:log_level])

  dna = {"recipes" => [recipe_name], "platform" => "ubuntu", "platform_version" => '9.0.4' }
  chef_solo = Chef::Client.new
  chef_solo.json_attribs = dna
  chef_solo.node_name = "latte"
  chef_solo.run_solo
end
