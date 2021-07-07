# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  # code goes here
  doc = YAML.load_file(file_path)
#binding.pry
  doc

  hash = {"get_meaning" => {},"get_emoticon" => {}}

  doc.each do |key, value|
    hash["get_meaning"][value[1]] = key
    hash["get_emoticon"][value[0]] = doc[key][1]

  end
hash

end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here

  x = load_library(file_path)


  hash = x["get_emoticon"][english_emoticon]

  if hash == nil
    return "Sorry, that emoticon was not found"
  end
  hash

end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  x =  load_library(file_path)

  hash = x["get_meaning"][japanese_emoticon]


  if hash == nil
    return "Sorry, that emoticon was not found"
  end
  hash

end
