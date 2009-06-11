When /^I run '([^']*)'$/ do |recipe_name|
  When %(I run chef-solo with the '#{recipe_name}' recipe)
end

Then /^'([^']*)' should be installed$/ do |package|
  pending
end

Then /^'([^']*)' should be installed configured .*? '([^']*)'$/ do |package, config|
  pending
end

Then /^'([^']*)' version '([^']*)' should be installed configured .*? '([^']*)'$/ do |package, version, config|
  pending
end

Then /^the server should have the hostname '([^']*)'$/ do |hostname|
  pending
end

Then /^the packages '([^']*)' should be installed$/ do |package_list|
  pending
end

Then /^the application '([^']*)' from the repository '([^']*)' and branch '([^']*)' should be running with the '([^']*)' environment at '([^']*)'$/ do |name, repository, branch, environment, canonical_url|
  pending
end
