# Duply Puppet Module for Boxen

Installs Duply and its necessary dependencies:

* `duplicity`
* `gnupg`
* `python`

[![Build Status](https://travis-ci.org/andschwa/puppet-duply.png?branch=master)](https://travis-ci.org/andschwa/puppet-duply)

## Usage

```puppet
include duply
```

## Required Puppet Modules

* `boxen`
* `homebrew`
    * `repository`
* `gnupg` [andschwa source](https://github.com/andschwa/puppet-gnupg)
* `python` [andschwa fork](https://github.com/andschwa/puppet-python)
  with 2.7.6 update

## Development

Set `GITHUB_API_TOKEN` in your shell with a [Github oAuth Token](https://help.github.com/articles/creating-an-oauth-token-for-command-line-use) to raise your API rate limit. You can get some work done without it, but you're less likely to encounter errors like `Unable to find module 'boxen/puppet-boxen' on https://github.com`.

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
