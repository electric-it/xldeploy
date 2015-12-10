name    'xldeploy'
version '1.0.0'

description 'Installs and configures XL Deploy from XebiaLabs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

supports 'centos'

license 'Apache v2.0'

source_url 'https://github.com/electric-it/xldeploy'
issues_url 'https://github.com/electric-it/xldeploy/issues'

depends 'runit',  '~> 1.5'
depends 'java',   '~> 1.25'
depends 'tar',    '~> 0.5'
