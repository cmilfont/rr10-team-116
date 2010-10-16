Given /^I have the following (.+):$/ do |name, table|
  table.hashes.each do |hash|
    Factory( name.singularize, hash )
  end
end

