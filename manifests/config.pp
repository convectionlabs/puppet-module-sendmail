# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker smartindent
#
# == Class: sendmail::config
# ---
#
# Sendmail module configuration
#
class sendmail::config inherits sendmail {

  # Smart Relay
  if $relay_smart {
    contain "${name}::relay"
  }

  if $aliases {
    contain "${name}::aliases"
  }

}

