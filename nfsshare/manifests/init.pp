
class nfsshare{
  node server {
    include nfs::server::ubuntu
    nfs::server{ '/data_folder':
      ensure => 'mounted',
      clients => '192.168.56.0/24(rw,insecure,sync,all_squash,no_subtree_check,anonuid=1000,anongid=1000)'
  }


#	mount { 'resource title':
#		name        => Tomato-Data,
#		ensure      => present,
#		blockdevice => # The device to fsck.  This is property is only...
#		device      => /dev/sdb,
#		dump        => # Whether to dump the mount.  Not all platform...
#		fstype      => ext4,
#		options     => # Mount options for the mounts, as they would...
#		pass        => # The pass in which the mount is...
#		provider    => # The specific backend to use for this `mount...
#		remounts    => true
#		target      => # The file in which to store the mount table....
#		# ...plus any applicable metaparameters.
#	}
    exec { "apt-get update":
	    command => "/usr/bin/apt-get update",
    }

    Package {
        ensure  => present,
        require => Exec['apt-get update'],
    }

    package { "build-essential": }
    package { "git-core": }
    package { "curl": }
    package { "wget": }
    package { "gnupg": }
    package { "flex": }
    package { "bison": }
    package { "gperf": }
    package { "libsdl1.2-dev": }
    package { "libesd0-dev": }
    package { "libwxgtk2.8-dev": }
    package { "squashfs-tools": }
    package { "zip": }
    package { "libncurses5-dev": }
    package { "zlib1g-dev": }
    package { "openjdk-6-jre": }
    package { "openjdk-6-jdk": }
    package { "pngcrush": }
    package { "schedtool": }
    package { "libxml2": }
    package { "xsltproc": }
    package { "g++-multilib": }
    package { "lib32z1-dev": }
    package { "lib32ncurses5-dev": }
    package { "lib32readline-gplv2-dev": }
    package { "gcc-4.6-multilib": } # would ideally like 4.7
#    package { "g++-4.5-multilib": }
    package { "libxml2-utils": }
	package { "samba": }

#    exec { 'install repo':
#        cwd     => '/usr/local/bin/',
#        command => 'bash -c "wget https://dl-ssl.google.com/dl/googlesource/git-repo/repo && chmod u+x repo"',
#        creates => '/usr/local/bin/repo',
#        require => [ Package['wget'], Package['git-core'] ],
#    }

#    file { "/home/vagrant/.gitconfig" :
#        source  => "/vagrant/gitconfig",
#        owner   => 'vagrant',
#        group   => 'vagrant',
#    }

#    # android SDK (only really needed if you're 'extracting' the proprietary blobs directly from the device
#    exec { 'download and install android sdk':
#        user    => 'vagrant',
#        cwd     => '/home/vagrant',
#        command => 'bash -c "mkdir -p sdk && cd sdk && wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-20130219.zip && unzip adt-bundle-linux-x86_64-20130219.zip"',
#        timeout => 600,
#        creates => '/home/vagrant/sdk/adt-bundle-linux-x86_64-20130219/sdk/platform-tools/adb',
#        require => [ Package['zip'], Package['wget'] ],
#    }

#    exec { 'update path':
#        user    => 'vagrant',
#        cwd     => '/home/vagrant',
#        command => 'bash -c "echo export PATH=\"\${PATH}:~/sdk/adt-bundle-linux-x86_64-20130219/sdk/platform-tools\" >> .bashrc"',
#    }

    # repo init/sync:
    # repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
    # repo sync

    # get prebuilt
    # cd ~/android/system/vendor/cm
    # ./get-prebuilts

}
}