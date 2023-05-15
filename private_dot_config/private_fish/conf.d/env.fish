### Setup XDG env vars
### See https://wiki.archlinux.org/title/XDG_Base_Directory for more information
# XDG_CONFIG_HOME
#     Where user-specific configurations should be written (analogous to /etc).
#     Should default to $HOME/.config.

set XDG_CONFIG_HOME $HOME/.config

# XDG_CACHE_HOME
#     Where user-specific non-essential (cached) data should be written (analogous to /var/cache).
#     Should default to $HOME/.cache.

set XDG_CACHE_HOME $HOME/.cache

# XDG_DATA_HOME
#     Where user-specific data files should be written (analogous to /usr/share).
#     Should default to $HOME/.local/share.

set XDG_DATA_HOME $HOME/.local/share

# XDG_STATE_HOME
#     Where user-specific state files should be written (analogous to /var/lib).
#     Should default to $HOME/.local/state.

set XDG_STATE_HOME $HOME/.local/state

# XDG_RUNTIME_DIR
#     Used for non-essential, user-specific data files such as sockets, named pipes, etc.
#     Not required to have a default value; warnings should be issued if not set or equivalents provided.
#     Must be owned by the user with an access mode of 0700.
#     Filesystem fully featured by standards of OS.
#     Must be on the local filesystem.
#     May be subject to periodic cleanup.
#     Modified every 6 hours or set sticky bit if persistence is desired.
#     Can only exist for the duration of the user's login.
#     Should not store large files as it may be mounted as a tmpfs.
#     pam_systemd sets this to /run/user/$UID.

### NON-STANDARD ###
# XDG_BIN_HOME
# 		Where user-created bin applications are stored.
# 		This is a non-standard location, and is added for ease of use later on.

set XDG_BIN_HOME $HOME/.local/bin

###############################
### Set up user env variables
###############################

#########################
## Set up our preferred
## 		applications
#########################

# Set our default editor
set -x EDITOR nvim

# Add a few well-known user bin paths
set -x N_PREFIX $XDG_DATA_HOME/.npm

# Where our PNPM information can live normally.
set -x PNPM_HOME $XDG_DATA_HOME/pnpm

# Bob is a Neovim version manager.
# Much lighter and faster than trying to manually compile,
# plus allows symlink-driven switching between versions (such as stable/nightly).
set -x BOB_NVIM_BASE $XDG_DATA_HOME/bob/nvim-bin

# Set up fuzzyfinder so that it ignores things in .git and node_modules
set -x FZF_DEFAULT_COMMAND 'rg --files --follow'

# Where to find projects when using the `pj` command
set -x POSSIBLE_PROJECT_PATHS ~/dev/personal ~/dev/utas ~/dev
set -x PROJECT_PATHS (
	for p in $POSSIBLE_PROJECT_PATHS
		if test -d $p; echo $p; end
	end
)

# OpenAI API key
set -x OPENAI_API_KEY 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

##########################
# Set up our PATH entries
##########################


# # Check the local node_modules binaries folder (if exists) first.
# # 		This is insecure, but as a web dev, /significantly/ more practical
# # 		than using npx or prefixing all calls with the node_modules path.
set -x PATH ./node_modules/.bin $PATH
#
# A known reference to where npm stores its globally installed packages.
# 		Having it stored within the users home directory means that `npm i -g` 
# 		doesn't require sudo priviledges
fish_add_path $N_PREFIX/bin

# The location to find the Bob Neovim binary.
fish_add_path $BOB_NVIM_BASE

# Where to find the users own applications
fish_add_path $XDG_BIN_HOME

# Where PNPM is installed.
fish_add_path $PNPM_HOME
 
# Go path
# fish_add_path (/usr/bin/go env GOPATH)/bin
