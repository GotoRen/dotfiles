## ⚠️ WARNING: Description => Issues
1. You should use `bash` => `zsh` as the default SHELL instead of `dash`.
```sh
$ sudo dpkg-reconfigure dash # change shell: dash -> bash
$ ls -l /bin/sh              # /bin/sh -> bash
```
2. You do not need an alias for `brew` in `./zsh/alias.zsh`.
3. You modify `./zsh/config.zsh`.

| Command | where |
| :--- | :--- |
| `asdf` | `. /home/linuxbrew/.linuxbrew/Cellar/asdf/0.10.2/libexec/asdf.sh` |
| `kube_ps1` | `/home/linuxbrew/.linuxbrew/Cellar/kube-ps1/0.7.0/share/kube-ps1.sh` |
| `google-cloud-sdk` | - |

4. Install google-cloud-sdk.
    - https://cloud.google.com/sdk/docs/install
```
$ echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
$ curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
$ sudo apt-get update && sudo apt-get install google-cloud-cli
$ which gcloud
/usr/bin/gcloud
```
