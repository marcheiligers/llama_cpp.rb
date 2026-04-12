# frozen_string_literal: true

require 'mkmf'

unless pkg_config('llama')
  abort('libllama is not found.') unless have_library('llama')
  abort('llama.h is not found.') unless have_header('llama.h')
end

create_makefile('llama_cpp/llama_cpp')
