admin_key = "#{node['delivery']['cookbook']['path']}/admin.pem"
template admin_key do
  source 'key.erb'
  cookbook 'my-delivery-truck'
  variables(
    key_string: node['delivery']['cookbook']['deploy_pass']
  )
end

node['delivery']['cookbook']['organizations'].split(' ').each do |org|
  
  publish_role node['delivery']['cookbook']['role_name'] do
    endpoint org
    client node['delivery']['cookbook']['deploy_user']
    key admin_key
    cookbookName node['delivery']['cookbook']['name']
    version node['delivery']['cookbook']['version'] 
    environment node['delivery']['cookbook']['environment']
    team_role node['delivery']['cookbook']['role_description']
  end

end
     

