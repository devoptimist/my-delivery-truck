#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Everything we need comes with chef-dk
#
# If the end-user is still using chef-dk 0.12 we would need to install
# knife-supermarket gem since we made it part of DK in version 0.13
#
# Notify the user that they need to upgrade to the latest chef-dk since
# we don't want to install gems that we already ship within DK.
#
# TODO: Remove this in Stage 2
chef_gem 'knife-supermarket' do
  compile_time false
  action :install
end
