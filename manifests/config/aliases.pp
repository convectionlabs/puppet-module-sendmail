# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker smartindent
#
# == Class: sendmail::config::aliases
# ---
#
# Create puppet mailalias resources
#
class sendmail::config::aliases(

  $hieramerge = $::sendmail::hieramerge,
  $aliases    = $::sendmail::aliases,

) {

  $defaults = {
    'ensure'  => 'present',
    'notify'  => Exec['sendmail-newaliases'],
  }

  if $hieramerge {
    $x_aliases = hiera_hash('sendmail::aliases', $aliases)
  } else {
    $x_aliases = $aliases
  }

  if $x_aliases {
    validate_hash($x_aliases)

    create_resources('mailalias', $x_aliases, $defaults)
  }

  exec { 'sendmail-newaliases':
    refreshonly => true,
    command     => '/usr/bin/newaliases',

  }

}

