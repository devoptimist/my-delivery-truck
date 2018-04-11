execute "syntax_check_#{node['delivery']['cookbook']['path']}" do
  command "knife cookbook test -o #{node['delivery']['cookbook']['path']} -a"
end
