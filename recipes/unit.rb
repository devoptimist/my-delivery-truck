execute "unit_rspec_#{node['delivery']['cookbook']['path']}" do
  cwd node['delivery']['cookbook']['path']
  command "rspec --format documentation --color"
end
