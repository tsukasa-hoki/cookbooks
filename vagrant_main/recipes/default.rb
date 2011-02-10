require_recipe "apt"
require_recipe "apache2"
require_recipe "apt"
require_recipe "zsh"
require_recipe "screen"
require_recipe "vim"
require_recipe "git"
require_recipe "apache2"
require_recipe "openssh"
require_recipe "openssl"
require_recipe "mysql"
require_recipe "mongodb"
require_recipe "sqlite"
require_recipe "perl"
require_recipe "php"
require_recipe "ruby"
require_recipe "passenger"
require_recipe "python"
require_recipe "memcached"
require_recipe "capistrano"

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

web_app "project" do
  template "project.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end
