# frozen_string_literal: true

require 'mkmf'

if system('pkg-config', '--exists', 'llama')
  $CFLAGS  << ' ' << `pkg-config --cflags llama`.strip
  $LDFLAGS << ' ' << `pkg-config --libs llama`.strip
else
  abort('libllama is not found.') unless have_library('llama')
  abort('llama.h is not found.') unless have_header('llama.h')
end

create_makefile('llama_cpp/llama_cpp')
