name             'collins'
maintainer       'Bao Nguyen'
maintainer_email 'ngqbao@gmail.com'
license          'All rights reserved'
description      'Installs/Configures Collins by Tumblr'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w( java openssl ).each do |cp|
  depends cp
end
