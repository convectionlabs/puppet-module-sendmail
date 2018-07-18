# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker smartindent
#
# == Class: sendmail
# ---
#
# Puppet Sendmail module
#
# === Parameters
# ---
#
# [*enabled*]
# - Default - true
# - Expects - boolean
# - Enables the service
#
# [*svc*]
# - Default - sendmail
# - Expects - string
# - Service name
#
# [*packages*]
# - Default
#   [
#     'sendmail',
#     'sendmail-cf',
#     'cyrus-sasl-plain',
#   ]
# - Expects - array
# - List of packages to install
#
# [*relay_smart*]
# - Default - true
# - Expects - boolean
# - Enables smart mail relay
#
# [*relay_host*]
# - Default - UNDEF
# - Expects - string
# - Smart mail relay host
#
# [*relay_user*]
# - Default - UNDEF
# - Expects - string
# - Smart mail relay user (authentication)
#
# [*relay_pass*]
# - Default - UNDEF
# - Expects - string
# - Smart mail relay user password (authentication)
#
# [*aliases*]
# - Default - UNDEF
# - Expects - hash
# - A hash of puppet mailalias resources
#
# [*hieramerge*]
# - Default - false
# - Expects - boolean
# - Enables hiera merging for hash based parameter lookups
#
class sendmail(
  $enabled      = true,
  $svc          = 'sendmail',
  $packages     = [
    'sendmail',
    'sendmail-cf',
    'cyrus-sasl-plain',
  ],
  $relay_smart  = true,
  $relay_host   = undef,
  $relay_user   = undef,
  $relay_pass   = undef,
  $aliases      = undef,
  $hieramerge   = false,
) {

  validate_bool     ( $enabled      )
  validate_string   ( $svc          )
  validate_array    ( $packages     )
  validate_bool     ( $relay_smart  )
  if $relay_smart {
    if $relay_host == undef {
      fail("Parameter 'relay_host' is required when 'relay_smart' enabled.")
    }
    validate_string ( $relay_host   )
    if $relay_user == undef {
      fail("Parameter 'relay_user' is required when 'relay_smart' enabled.")
    }
    validate_string ( $relay_user   )
    if $relay_pass == undef {
      fail("Parameter 'relay_pass' is required when 'relay_smart' enabled.")
    }
    validate_string ( $relay_pass   )
  }
  validate_bool     ( $hieramerge   )

  clabs::module::init { $name: }

}

