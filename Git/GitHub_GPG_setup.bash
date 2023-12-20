#!/bin/bash

# Generate a new GPG key
gpg --full-generate-key

# List the GPG keys and extract the KEY_ID
KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2)

# Copy the GPG key to the clipboard
gpg --armor --export $KEY_ID | xclip -selection clipboard

# Clean up temporary files
rm ~/.gnupg/pubring.kbx~
rm ~/.gnupg/trustdb.gpg~

# Open the GitHub GPG key page in the default browser
xdg-open "https://github.com/settings/gpg/new"

# Some mistakes were made, so I had to delete the key and start again.