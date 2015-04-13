function install_git() {
	which git > /dev/null
	GIT_FOUND=$?
	if [ "$GIT_FOUND" -eq '0' ]; then
	  echo 'Git found'
	else
	  echo 'Installing Git'
	  apt-get -q -y install git
	  echo 'Git installed'
	fi
}

function install_librarian_puppet() {
  if [ `gem search -i librarian-puppet` != true ]; then
    echo 'Installing librarian-puppet'
		apt-get -q -y install ruby-dev
    mkdir -p /etc/puppet
    gem install librarian-puppet -v 2.1.0
  fi
}

# execute script
apt-get -q -y update
install_git
install_librarian_puppet
cp /vagrant/puppet/Puppetfile /etc/puppet
cd /etc/puppet && librarian-puppet install --clean
