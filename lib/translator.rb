# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  doc = YAML.load_file(file_path)

  doc

  #YAML.dump(file_path)
   #{ a: 'b'}.to_yaml

end

def get_japanese_emoticon(file_path,english_emoticon)
  # code goes here
hash = {english_emoticon: {}}

hash
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  hash = {japanese_emoticon: {}}

  hash

end
