require "bundler"
Bundler.require
require "pry"
require 'require_all'
require "tty-prompt"
require "lolize"



require_all 'lib'

PROMPT = TTY::Prompt.new
COLORIZER = Lolize::Colorizer.new
    

# binding.pry
# puts ""