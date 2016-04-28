class ntp($ntp_servers){
	package { 'ntp':
		ensure => latest,
	}

	file { '/etc/ntp.conf':
		ensure => file,
		#source => 'puppet:///modules/ntp/ntp.conf.tmpl'
		content => template('/etc/puppet/modules/ntp/templates/ntp.conf.tmpl')
	}

	service { 'ntpd':
		ensure => running,
		enable => true,
	}
	Package['ntp'] ~> File['/etc/ntp.conf'] ~> Service['ntpd']
}
