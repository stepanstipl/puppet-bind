# ex: syntax=puppet si ts=4 sw=4 et
class bind::params {
    $forwarders    = ''
    $dnssec        = true
    $version       = ''
    $random_device = '/dev/random'

    if $::osfamily == 'Debian' {
        $bind_user        = 'bind'
        $bind_group       = 'bind'
        $bind_package     = 'bind9'
        $bind_service     = 'bind9'
        $nsupdate_package = 'dnsutils'
        $namedconf        = '/etc/bind/named.conf'
        $confdir          = '/etc/bind'
        $cachedir         = '/var/cache/bind'
        $rndc             = true
        $updater_keydir   = '/etc/bind/keys'

        $bind_files = [
            "${::bind::confdir}/bind.keys",
            "${::bind::confdir}/db.empty",
            "${::bind::confdir}/db.local",
            "${::bind::confdir}/db.root",
            "${::bind::confdir}/db.0",
            "${::bind::confdir}/db.127",
            "${::bind::confdir}/db.255",
            "${::bind::confdir}/named.conf.default-zones",
            "${::bind::confdir}/zones.rfc1918",
        ]
    }
    elsif $::osfamily == 'RedHat' {
        $bind_user        = 'named'
        $bind_group       = 'named'
        $bind_package     = 'bind'
        $bind_service     = 'named'
        $nsupdate_package = 'bind-utils'
        $namedconf        = '/etc/named.conf'
        $confdir          = '/etc/named'
        $cachedir         = '/var/named'
        $rndc             = true

        $updater_keydir   = '/etc/named/keys'
        $bind_files = ['/etc/named.root.key']
    }
    else {
        fail('Platform is not supported')
    }
}
