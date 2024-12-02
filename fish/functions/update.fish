# System Update Function
function update --description 'Update system and development tools'
  echo "🔄 Updating system packages..."
  brew update
  and brew upgrade
  and brew cleanup
  
  echo "🐍 Updating Python..."
  pyenv update
  
  # echo "📦 Updating Node..."
  # fnm install --lts
  
  # echo "🦀 Updating Rust..."
  # if type -q rustup
  #     rustup update
  # end
  
  echo "✨ System update complete!"
end
