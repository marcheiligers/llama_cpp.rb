# frozen_string_literal: true

require 'mkmf'

if system('pkg-config', '--exists', 'llama')
  # Homebrew's llama.pc is missing `Requires: ggml`, so query ggml too if present.
  pkgs = system('pkg-config', '--exists', 'ggml') ? 'ggml llama' : 'llama'
  $CFLAGS  << ' ' << `pkg-config --cflags #{pkgs}`.strip
  $LDFLAGS << ' ' << `pkg-config --libs #{pkgs}`.strip
else
  abort('libllama is not found.') unless have_library('llama')
  abort('llama.h is not found.') unless have_header('llama.h')
end

create_makefile('llama_cpp/llama_cpp')
