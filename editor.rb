#!/usr/bin/env ruby

require_relative 'edit_image'
require 'readline'

editor = EditImage.new
while params = Readline.readline('> ', true)
  editor.run(params)
end
