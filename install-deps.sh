#!/usr/bin/env bash
#
# Install external dependencies for Neovim configuration
# Supports: Ubuntu/Debian, Fedora/RHEL, Arch Linux

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# Detect package manager
detect_distro() {
  if command -v pacman &>/dev/null; then
    echo "arch"
  elif command -v dnf &>/dev/null; then
    echo "fedora"
  elif command -v apt &>/dev/null; then
    echo "debian"
  else
    error "Unsupported distribution. Please install dependencies manually."
  fi
}

install_arch() {
  info "Installing dependencies for Arch Linux..."
  sudo pacman -S --needed --noconfirm \
    git \
    make \
    gcc \
    ripgrep \
    fd \
    python \
    tmux \
    trash-cli \
    lazygit \
    curl \
    wget
}

install_fedora() {
  info "Installing dependencies for Fedora..."
  sudo dnf install -y \
    git \
    make \
    gcc \
    ripgrep \
    fd-find \
    python3 \
    tmux \
    trash-cli \
    curl \
    wget

  # lazygit is not in default repos, install from COPR
  if ! command -v lazygit &>/dev/null; then
    info "Installing lazygit from COPR..."
    sudo dnf copr enable -y atim/lazygit
    sudo dnf install -y lazygit
  fi
}

install_debian() {
  info "Installing dependencies for Ubuntu/Debian..."
  sudo apt update
  sudo apt install -y \
    git \
    make \
    gcc \
    ripgrep \
    fd-find \
    python3 \
    tmux \
    trash-cli \
    curl \
    wget

  # Create fd symlink (Debian/Ubuntu package is named fd-find)
  if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
    info "Creating symlink for fd..."
    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
  fi

  # lazygit is not in default repos
  if ! command -v lazygit &>/dev/null; then
    info "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo install /tmp/lazygit /usr/local/bin
    rm /tmp/lazygit.tar.gz /tmp/lazygit
  fi
}

check_nerd_font() {
  warn "Nerd Font must be installed manually."
  echo "  Download from: https://www.nerdfonts.com/font-downloads"
  echo "  Recommended: JetBrainsMono Nerd Font, FiraCode Nerd Font, or Hack Nerd Font"
  echo "  After downloading, set it as your terminal font."
}

verify_installation() {
  info "Verifying installation..."
  local missing=()

  for cmd in git make gcc rg fd python3 tmux trash-put lazygit curl; do
    if ! command -v "$cmd" &>/dev/null; then
      missing+=("$cmd")
    fi
  done

  if [ ${#missing[@]} -eq 0 ]; then
    info "All dependencies installed successfully!"
  else
    warn "Missing commands: ${missing[*]}"
    echo "  Some features may not work correctly."
  fi
}

main() {
  info "Neovim Configuration Dependency Installer"
  echo ""

  DISTRO=$(detect_distro)
  info "Detected distribution: $DISTRO"

  case "$DISTRO" in
    arch) install_arch ;;
    fedora) install_fedora ;;
    debian) install_debian ;;
  esac

  echo ""
  verify_installation
  echo ""
  check_nerd_font
  echo ""
  info "Done! Mason will automatically install LSP servers and formatters on first Neovim launch."
}

main "$@"
