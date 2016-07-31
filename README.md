# HsbcLatestDownload

A script to download latest transactional data as OFX from HSBC personal online banking.

Use at own risk.


## Installation

    $ gem install hsbc_latest_download

## Usage

    # Options
    hsbc_latest_download username memorableword password [optionalaccountname=HSBC ADVANCE]

    # Example. Passing credentials like this is insecure. At minimum use [HISTCONTROL](http://www.linuxjournal.com/content/using-bash-history-more-efficiently-histcontrol)
    hsbc_latest_download IB1234567890 mymemorableword mypassword

    # Example using [password manager](https://www.passwordstore.org/)
    hsbc_latest_download IB1234567890 `pass hsbc.co.uk.memorable` `pass hsbc.co.uk.password`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

