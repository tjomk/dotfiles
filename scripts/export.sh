#!/usr/bin/env bash
set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"

print_info "Exporting configurations to: $DOTFILES_DIR"
echo ""

# Export Zsh configuration
if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$DOTFILES_DIR/.zshrc"
    print_success "Exported .zshrc"
else
    print_warning ".zshrc not found"
fi

# Export Vim configuration
if [ -f "$HOME/.vimrc" ]; then
    cp "$HOME/.vimrc" "$DOTFILES_DIR/.vimrc"
    print_success "Exported .vimrc"
else
    print_warning ".vimrc not found"
fi

# Export tmux configuration
if [ -f "$HOME/.tmux.conf" ]; then
    cp "$HOME/.tmux.conf" "$DOTFILES_DIR/.tmux.conf"
    print_success "Exported .tmux.conf"
else
    print_warning ".tmux.conf not found"
fi

# Export Alacritty configuration
if [ -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    cp "$HOME/.config/alacritty/alacritty.toml" "$DOTFILES_DIR/alacritty.toml"
    print_success "Exported alacritty.toml"
elif [ -f "$HOME/.config/alacritty/alacritty.yml" ]; then
    cp "$HOME/.config/alacritty/alacritty.yml" "$DOTFILES_DIR/alacritty.yml"
    print_success "Exported alacritty.yml"
else
    print_warning "Alacritty config not found"
fi

# Export Hammerspoon configuration
if [ -f "$HOME/.hammerspoon/init.lua" ]; then
    cp "$HOME/.hammerspoon/init.lua" "$DOTFILES_DIR/init.lua"
    print_success "Exported Hammerspoon init.lua"
else
    print_warning "Hammerspoon init.lua not found"
fi

# Export additional Hammerspoon files if they exist
if [ -d "$HOME/.hammerspoon" ]; then
    mkdir -p "$DOTFILES_DIR/hammerspoon"
    for file in "$HOME/.hammerspoon"/*.lua; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "init.lua" ]; then
            cp "$file" "$DOTFILES_DIR/hammerspoon/"
            print_success "Exported $(basename "$file")"
        fi
    done
fi

# Export git config (without sensitive info)
if [ -f "$HOME/.gitconfig" ]; then
    print_info "Copying git config..."
    # Copy but remove user-specific info that should be set manually
    grep -v "email\|signingkey" "$HOME/.gitconfig" > "$DOTFILES_DIR/.gitconfig" 2>/dev/null || true
    print_success "Exported .gitconfig (without email/keys)"
    print_warning "Remember to set your git user.email and user.name manually"
fi

# Create a list of installed applications
if command -v brew &> /dev/null; then
    print_info "Creating list of installed Homebrew packages..."
    brew list --formula > "$DOTFILES_DIR/brew-formulas.txt"
    brew list --cask > "$DOTFILES_DIR/brew-casks.txt"
    print_success "Exported Homebrew package lists"
fi

# Export custom scripts from ~/bin if they exist
if [ -d "$HOME/bin" ]; then
    print_info "Copying custom scripts..."
    mkdir -p "$DOTFILES_DIR/bin"
    cp -r "$HOME/bin/"* "$DOTFILES_DIR/bin/" 2>/dev/null || true
    print_success "Exported custom scripts from ~/bin"
fi

echo ""
print_success "🎉 Export complete!"
echo ""
print_info "Next steps:"
echo "  1. Review exported files in: $DOTFILES_DIR"
echo "  2. Remove any sensitive information (passwords, tokens, etc.)"
echo "  3. Commit to git:"
echo "     cd $DOTFILES_DIR"
echo "     git add ."
echo "     git commit -m 'Update dotfiles'"
echo "     git push"
echo ""
print_warning "Remember: Never commit sensitive data like API keys or passwords!"
