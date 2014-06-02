###
# Do not use this file to override the synchronization_server cookbook's default
# attributes.  Instead, please use the customize.rb attributes file,
# which will keep your adjustments separate from the AWS OpsWorks
# codebase and make it easier to upgrade.
#
# However, you should not edit customize.rb directly. Instead, create
# "synchronization_server/attributes/customize.rb" in your cookbook repository and
# put the overrides in YOUR customize.rb file.
#
# Do NOT create an 'synchronization_server/attributes/synchronization_server.rb' in your cookbooks. Doing so
# would completely override this file and might cause upgrade issues.
#
# See also: http://docs.aws.amazon.com/opsworks/latest/userguide/customizing.html
###

include_attribute 'deploy'
include_attribute 'opsworks_commons::default'

default[:synchronization_server][:version] = '0.10.27'
default[:synchronization_server][:pkgrelease] = '1'

arch = RUBY_PLATFORM.match(/64/) ? 'amd64' : 'i386'
default[:synchronization_server][:deb] = "opsworks-nodejs-#{node[:synchronization_server][:version]}-#{node[:synchronization_server][:pkgrelease]}_#{arch}.deb"
default[:synchronization_server][:deb_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:synchronization_server][:deb]}"

rhel_arch = RUBY_PLATFORM.match(/64/) ? 'x86_64' : 'i686'
default[:synchronization_server][:rpm] = "opsworks-nodejs-#{node[:synchronization_server][:version]}-#{node[:synchronization_server][:pkgrelease]}.#{rhel_arch}.rpm"
default[:synchronization_server][:rpm_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:synchronization_server][:rpm]}"

include_attribute "synchronization_server::customize"
