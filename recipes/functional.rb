execute "kitchen_#{node['delivery']['cookbook']['path']}" do
  cwd node['delivery']['cookbook']['path']
  command "chef exec kitchen test"
end
