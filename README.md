# HsbcLatestDownload

A selenium script written in ruby to download latest transactional data as OFX from HSBC personal online banking.

Use at own risk.

## Installation

### Basic installation

    gem install hsbc_latest_download

### To install with signature checks to ensure that the gem has not been tampered with

    gem cert --add <(curl -Ls https://raw.githubusercontent.com/mattfawcett/hsbc_latest_download/master/certs/mattfawcett.pem)

    gem install hsbc_latest_download -P MediumSecurity

## Usage
Example. Run with no arguments and you will be promted for username, memorable word, and password

    hsbc_latest_download

Example. Passing credentials like this is insecure. At minimum use [HISTCONTROL](http://www.linuxjournal.com/content/using-bash-history-more-efficiently-histcontrol)

    hsbc_latest_download -u username -m memorableword -p password [-a optionalaccountname]

Example using [password manager](https://www.passwordstore.org/)

    hsbc_latest_download -u IB1234567890 -m `pass hsbc.co.uk.memorable` -p `pass hsbc.co.uk.password`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

