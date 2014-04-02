node default {
    include apt
    include stdlib

    class { 'redis':
        conf_port => '6379',
        conf_bind => '0.0.0.0',
    }

    package { 'sinatra':
        ensure   => 'installed',
        provider => 'gem',
    } ->

    exec { 'redis-gem':
        command => '/usr/bin/sudo /opt/ruby/bin//gem install redis',
    } ->

    exec { 'sinatra-gem':
        command => '/usr/bin/sudo /opt/ruby/bin//gem install sinatra',
    } ->

    file { '/etc/init/shorty.conf':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => '0644',
        source  => 'puppet:///modules/shorty/shorty.conf',
    } ->

    file { '/opt/shorty':
        ensure  => directory,
        owner   => root,
        group   => root,
        mode    => '0754',
    } ->

    file { '/opt/shorty/views':
        ensure  => directory,
        owner   => root,
        group   => root,
        mode    => '0754',
    } ->

    file { '/opt/shorty/app.rb':
        ensure  => present,
        source  => 'puppet:///modules/shorty/app.rb',
        owner   => root,
        group   => root,
        mode    => '0755',
    } ->

    file { '/opt/shorty/views/index.erb':
        ensure  => present,
        source  => 'puppet:///modules/shorty/index.erb',
        owner   => root,
        group   => root,
        mode    => '0644',
    } ->

    service { 'shorty':
        ensure     => running,
        enable     => true
    }
}
