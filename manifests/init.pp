# Module: timezone
#
class timezone (
    $timezone = 'UTC',
    $ensure = 'present',
    $package = 'tzdata',
    $zoneinfo_dir = '/usr/share/zoneinfo/',
    $config_file = '/etc/localtime' ) {

    package { $package:
        ensure => $ensure,
    }

    file { $config_file:
        ensure  => $config_ensure,
        target  => "${zoneinfo_dir}${timezone}",
        require => Package[$package],
    }
}
