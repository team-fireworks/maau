# MAAU

The Many Accounts Audio Uploader. An audio asset-as-files tool for Roblox,
working around Roblox's audio upload quota by uploading through many accounts.

## Installation

### Rokit

```sh
rokit add team-fireworks/maau
rokit install
```

## Setup

```toml
# .maau/config.toml
[[key]]
id = 1234567890
quota = 10
key = "abcdef1234567890"
```

### API Keys

You should not commit this file to Git.

```toml
# .maau/keys.toml
[[key]]
id = 1234567890
quota = 10
key = "abcdef1234567890"
```

### Configuration
