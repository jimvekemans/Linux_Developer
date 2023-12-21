To configure your `gpg-agent` to save your GPG key passphrase for GitHub, you need to edit your `gpg-agent` configuration file. Here are the steps:

1. Open your `gpg-agent` configuration file. This file is usually located in the `~/.gnupg` directory and is named `gpg-agent.conf`. If the file does not exist, create it.

2. Add the following lines to the file:

```bash
default-cache-ttl 34560000
max-cache-ttl 34560000
```

These lines configure `gpg-agent` to cache your passphrase for 1 year (measured in seconds).

3. Save and close the file.

4. Restart the `gpg-agent` with the following command:

```bash
gpg-connect-agent reloadagent /bye
```

Now, `gpg-agent` should remember your passphrase for a year after you enter it.

Please note that storing your passphrase can pose a security risk if your system is compromised. Make sure to secure your system appropriately.