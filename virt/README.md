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
| `google-cloud-sdk` | nothing |

4. Install google-cloud-sdk.
    - https://cloud.google.com/sdk/docs/install
```sh
### gcloud
$ echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
$ curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
$ sudo apt update && sudo apt install google-cloud-cli
$ which gcloud

### plugin
$ sudo apt update && sudo apt install -y google-cloud-sdk-gke-gcloud-auth-plugin
$ gcloud components list
```

5. Install visual-studio-code.
```sh
### code
$ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
$ sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
$ sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
$ ls -l /etc/apt/sources.list.d | grep vscode.list
$ sudo apt update && apt list code && sudo apt install code
$ rm ./microsoft.gpg
$ code --version

### setting.json
$ ln -snfv $HOME/dotfiles/bin/vscode/settings.json ~/.config/Code/User/settings.json
```

6. VPN: softether client => L2TP over IPSec
- You'll need to remove the dummy IP for the VPN and adjust, because the connection is disconnected after a certain amount of time.
  - `/etc/network/if-up.d/vpn-fixed.sh`
  ```sh
  #!/bin/bash

  if [[ "$IFACE" =~ ^ppp[0-9] ]]; then
     PPP=`ip addr show dev $IFACE | grep 'scope global'`
     IP1=`echo $PPP | awk '{ print $2 }'`
     IP2=`echo $PPP | sed -e 's@/@ @g' | awk '{ print $4 }'`
     sudo ip addr del $IP1 peer $IP2 dev $IFACE
  fi
  ```
  - pre-log => `$ sudo /usr/lib/NetworkManager/nm-l2tp-service --debug`
  - References 
    - https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/946#note_1406609
    - https://github.com/nm-l2tp/NetworkManager-l2tp/issues/51
