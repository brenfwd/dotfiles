# dotfiles

Dependencies:

- [bun](https://bun.sh)

To setup:

```bash
cd ~
git clone <this repo>
cd dotfiles
bun install
```

Then load from `~/.bashrc` (replace any default prompt or aliases with the following line):

```bash
source ~/dotfiles/bash/load.sh
```

> [!IMPORTANT]
> In your `.bashrc`, there should be some lines added by bun's install script:
>
> ```bash
> # bun
> export BUN_INSTALL="$HOME/.bun"
> export PATH=$BUN_INSTALL/bin:$PATH
> ```
>
> Make sure that these lines come **before** the line that sources `~/dotfiles/bash/load.sh`.
