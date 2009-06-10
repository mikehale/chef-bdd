When /^I run '([^']*)'$/ do |recipe_name|
  When %(I run chef-solo with the '#{recipe_name}' recipe)
end

Then /^a rails app should exist in directory '([^']*)'$/ do |root_path|
  Then %(a directory named '#{root_path}' should exist)
  And %(a directory named '#{root_path}/config' should exist)
  And %(a file named '#{root_path}/config/environment.rb' should exist)
end
