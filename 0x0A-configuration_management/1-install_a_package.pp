# Puppet manifest to install Flask from pip3
#
# This manifest ensures that Flask version 2.0.1 is installed using pip3.

# Define the package resource to install Flask
package { 'flask':
  ensure   => '2.0.1',
  provider => 'pip3'
}

