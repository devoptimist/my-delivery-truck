execute "lint_foodcritic_#{node['delivery']['cookbook']['path']}" do
  command "foodcritic #{node['delivery']['cookbook']['path']}"
  end
execute "lint_cookstyle_#{node['delivery']['cookbook']['path']}" do
  command "cookstyle #{node['delivery']['cookbook']['path']}"
  live_stream true
end
