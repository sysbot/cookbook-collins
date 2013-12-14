# basic attributes
default[:collins][:app_name] = "collins"
default[:collins][:user] = node[:collins][:app_name]
default[:collins][:group] = node[:collins][:app_name]

# user/group id, set random in recipes
default[:collins][:uid] = 2012
default[:collins][:gid] = 2012

# options
default[:collins][:daemon_bin] = "/usr/bin/daemon"
default[:collins][:listen_port] = 8080
default[:collins][:file_limit] = 8192
default[:collins][:heap_opts] = "-XX:MaxPermSize=384m"

# local setup path
default[:collins][:install_dir] = "/home/#{node[:collins][:app_name]}"
default[:collins][:app_home] = node[:collins][:install_dir]

default[:collins][:scripts_dir] = "#{node[:collins][:install_dir]}/scripts"
default[:collins][:collins_sh] = "#{node[:collins][:scripts_dir]}/collins.sh"

default[:collins][:conf_dir] = "#{node[:collins][:install_dir]}/conf"

# logging
default[:collins][:log_dir] = "/var/log"
default[:collins][:run_dir] = "/var/run"

# remote repo
default[:collins][:url] = 'http://tumblr.github.io/collins/releases/collins-1.2.3.zip'
default[:collins][:checksum] = 'c9fe4935882eb7ff0d3e945425151a3dc5d9c25ce1ea6ad4c29d5a2c54b1bc24' #sha256

# play framework use for development
#default[:collins][:play_url] = 'http://download.playframework.org/releases/play-2.0.3.zip'

# default application secrets - overwrites on deployment
default[:collins][:app_secrets] = "5c7ad455e8652bc63715adc578dcf04e9ce007b46f9d47ec"

# defalt crypto key - overwrites on deployment
default[:collins][:cryto_key] = "06873d9f17bfe3cb9ef90868003e55587653b1dcd55f24f5"

# mysql database login info
default[:collins][:mysql_username] = "collins"
#default[:collins][:mysql_password] = "fe3cb9ef9086800"

# setup java
default['java']['install_flavor'] = "oracle"
default['java']['jdk_version'] = 6
default['java']['oracle']['accept_oracle_download_terms'] = true

# Java Cryto still needed to be installed, get it at:
# http://www.oracle.com/technetwork/java/javase/downloads/jce-6-download-429243.html