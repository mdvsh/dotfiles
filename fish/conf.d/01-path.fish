# Path Configuration

# Clear path to avoid duplicates
set -e fish_user_paths

# Core paths
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin

# Development tools
fish_add_path $HOME/.cargo/bin                    # Rust
fish_add_path /opt/homebrew/opt/ruby/bin          # Ruby
fish_add_path /opt/homebrew/opt/postgresql@14/bin # PostgreSQL