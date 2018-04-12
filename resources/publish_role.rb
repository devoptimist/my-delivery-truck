default_action :update

resource_name :publish_role

property :chefRole, String, name_attribute: true, required: true
property :endpoint, String, required: true
property :cookbookName, String, required: true
property :version, String, required: true
property :environment, String, required: true
property :team_role, String, required: true
property :client, String, required: true
property :key, String, required: true


action :update do
  require 'chef-api'
  ChefAPI.configure do |config|
    config.endpoint = new_resource.endpoint
    config.client = new_resources.client
    config.key = new_resource.key
    config.ssl_verify = false
  end
  
  r = ChefAPI::Resource::Role.fetch(new_resource.chefRole) || r = ChefAPI::Resource::Role.new({ name: new_resource.chefRole } )
  r.env_run_lists = {} unless r.env_run_lists
  r.description = new_resource.team_role unless r.description
  if r.description != new_resource.team_role
    raise "Role description does not match"
  else
    tmp_sring = "recipe[#{new_resource.cookbookName}@#{new_resource.version}]"
    if r.env_run_lists[new_resource.environment]
      r.env_run_lists[new_resource.environment].clear
    else
      r.env_run_lists[new_resource.environment] = []
    end
    r.env_run_lists[new_resource.environment][0] = tmp_sring
    r.save
  end 
end
