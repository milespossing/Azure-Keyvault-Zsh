# Azure Keyvault Plugin

A simple plugin to make using azure keyvault from the azure cli a little less verbose

## Setup

Clone this repo into your omz custom directory

```bash
git clone https://github.com/milespossing/Azure-Keyvault-Zsh.git $ZSH_CUSTOM/plugins/az-keyvault
```

Export a variable `$AZ_KEYVAULT_NAME` which should be the name of the keyvault you are
accessing.

This plugin requires [fzf](https://github.com/junegunn/fzf) and [jq](https://github.com/stedolan/jq)
to be installed.

## Usage

Secrets can be listed with the `list-secrets` command.

Secrets can be fetched by passing an array of secret names (optained by `list-secrets`) into `get-secrets`:

```bash
get-secrets sec1 sec2 sec3
```

Multiple secrets can be selected by using `fzf-secrets`

