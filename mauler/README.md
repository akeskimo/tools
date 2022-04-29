# Mauler

Program that can process input files from stdin and send them as email attachments.

The script keeps a track of files that needs processing in inbox folder and tracks
files that have been sent in outbox folder.

## Requirements

You will need mutt configured with OAuth2 refresh token and enable your mail server
with SMTP.

For instructions on how to setup refresh tokens, see [guide](https://gitlab.com/muttmua/mutt/-/blob/master/contrib/mutt_oauth2.py.README).

Minimum supported mutt version is 2.0.0.

## Usage

1. Collect files to be sent.

`./collect.sh test/`

2. Check files that will be sent.

`ls -l inbox/`

3. Commit inbox links to be sent as email attachments to given email address

`./maul.sh johndoe@zus.com`

## Project structure

`inbox`       File process queue.

`outbox`      List of files that have been successfully transferred.
