require 'yaml'
require 'pp'

def load_library(path)
  library = YAML.load_file(path)
  new_library = {get_meaning: {}, get_emoticon: {}}
  # pp library
  library.map do |key, value|
    new_library[:get_meaning][value[1]] = key;
    new_library[:get_emoticon][value[0]] = value[1];
  end
  # pp new_library
  new_library
end

def get_japanese_emoticon(path, eng)
  library = load_library(path)
  jap = "Sorry, that emoticon was not found"
  library[:get_emoticon].each_pair do |key, value|
    jap = value if key == eng
  end
  # p eng
  # p jap
  jap
end

def get_english_meaning(path, jap)
  library = load_library(path)
  mean = "Sorry, that emoticon was not found"
  library[:get_meaning].each_pair do |key, value|
    mean = value if key == jap
  end
  # p jap
  # p mean
  mean
end