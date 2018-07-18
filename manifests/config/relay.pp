# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker smartindent
#
# == Class: sendmail::config::relay
# ---
#
# Sendmail module relay configuration
#
class sendmail::config::relay inherits sendmail {

  Exec {
    path        => '/bin:/usr/bin',
    refreshonly => true,
  }

  exec {
    "${name}-rebuild_authinfo":
      command => 'makemap hash /etc/mail/authinfo < /etc/mail/authinfo';

    "${name}-rebuild_sendmail_mc":
      command => 'm4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf',
  }

  clabs::template {
    '/etc/mail/authinfo':     notify => Exec["${name}-rebuild_authinfo"];
    '/etc/mail/sendmail.mc':  notify => Exec["${name}-rebuild_sendmail_mc"];
  }

}

