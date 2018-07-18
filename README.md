# puppet-module-sendmail

Puppet module for sendmail

This module supports the use of sendmail for mail relaying purposes only.

## Requirements
---

- Puppet version 3 or greater with Hiera support
- Puppet Modules:

| OS Family      | Module |
| :------------- |:-------------: |
| ALL            | [clabs/core](https://bitbucket.org/convectionlabs/puppet-module-core)|

## Usage
---

Loading the sendmail class:

```puppet
include sendmail
```

## Configuration
---

All configuration settings should be defined using Hiera.

### RedHat Linux OS Family defaults

```yaml
sendmail::enabled       : true
sendmail::svc           : 'sendmail'
sendmail::packages:
    - 'sendmail'
    - 'sendmail-cf'
    - 'cyrus-sasl-plain'
sendmail::relay_smart   : true
```

### Example: Enable & configure sendmail relaying on RedHat Linux OS Family

```yaml
sendmail::relay_host    : 'email-smtp.us-east-1.amazonaws.com'
sendmail::relay_user    : 'ASDKFJWNEFJSNES'
sendmail::relay_pass    : 'asjfsASFANajsfajsfi2wwwkx34nss'
```

### Example: Enable hiera hash merging and setup a local mail alias for root

```yaml
sendmail::hieramerge    : true
sendmail::aliases:
  root:
    recipient: 'foo@example.com'
```

