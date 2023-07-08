# install flask app using pip3
package { 'Flask':
  ensure   => 'installed'
  provider => 'pip3'
}