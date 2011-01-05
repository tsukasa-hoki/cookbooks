execute 'apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10' do
  user 'root'
end

ubuntu_version = node[:platform_version]
ubuntu_version.gsub! '.0', '.'
execute "echo 'deb http://downloads.mongodb.org/distros/ubuntu #{ubuntu_version} 10gen' >> /etc/apt/sources.list" do
  user 'root'
  not_if 'grep mongodb /etc/apt/sources.list'
end

execute 'apt-get update' do
  user 'root'
end

package 'mongodb-stable'
