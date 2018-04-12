execute "unit_rspec_#{node['delivery']['cookbook']['path']}" do
  cwd node['delivery']['cookbook']['path']
  command "chef exec rspec --format documentation --color"
  live_stream true
end
