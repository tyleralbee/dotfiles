#!/usr/bin/env bash
#
################################################################################
# Generate bash tab-completion scripts (see completions array below for tools)
#
# Notes:
# - Completions are saved to "$BASH_COMPLETION_USER_DIR/completions/$tool"
# - If a completion already exists, it will be backed up to "*.bak"
# - If a tool is added to bash-completion completions-core, use that instead
#
# Resources:
# - https://gnu.org/software/gnuastro/manual/html_node/Bash-TAB-completion-tutorial
# - https://github.com/scop/bash-completion/tree/main/completions-core
################################################################################

# Constants
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
nc='\033[0m'

# Configuration
completions=(
    # "cheat --completion bash" # https://github.com/cheat/cheat?tab=readme-ov-file#autocompletion
    "codex completion bash"     # https://developers.openai.com/codex/cli/features/#shell-completions
    # "deno completions bash"   # https://docs.deno.com/runtime/reference/cli/completions/
    "node --completion-bash"    # https://nodejs.org/api/cli.html#completion-bash
    "pnpm completion bash"      # https://pnpm.io/completion
)
completions_dir="$BASH_COMPLETION_USER_DIR/completions"

################################################################################
# Helper Functions
################################################################################

log_info() {
    echo -e "${blue}[INFO]   ${nc} $1"
}

log_success() {
    echo -e "${green}[SUCCESS]${nc} $1"
}

log_warning() {
    echo -e "${yellow}[WARNING]${nc} $1"
}

log_error() {
    echo -e "${red}[ERROR]  ${nc} $1"
}

################################################################################
# Completion Generation Functions
################################################################################

generate_completion() {
    read -r tool _ <<< "$1"
    local cmd="$1"
    local out_path="$completions_dir/$tool"

    if [[ -f "$out_path" ]]; then
        cp "$out_path" "$out_path.bak"
        log_warning "$tool ($cmd) -> Overwriting existing completion file (backup created at $out_path.bak)"
    fi
    
    if ! eval "$cmd" > "$out_path" 2>/dev/null; then
        log_error "$tool ($cmd) -> Failure (is $tool installed and in PATH?)"
        return 1
    fi

    log_success "$tool ($cmd) -> $out_path"
}

generate_all_completions() {
    # Ensure completions directory exists
    mkdir -p "$completions_dir"

    for cmd in "${completions[@]}"; do
        generate_completion "$cmd"
    done
}

generate_all_completions
