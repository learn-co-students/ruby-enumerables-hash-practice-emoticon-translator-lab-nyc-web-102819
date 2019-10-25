require "yaml"
file_path = './lib/emoticons.yml'

def load_library(file_path)
  emoticon_data = YAML.load_file(file_path)
  new_hash = {
    get_meaning: {},
    get_emoticon: {},
  }
  emoticon_data.each do |key, value|
    new_hash[:get_meaning][value[1]] = key
    new_hash[:get_emoticon][value[0]] = value[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translation = load_library(file_path)[:get_emoticon][emoticon]
  translation ? translation : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  translation = load_library(file_path)[:get_meaning][emoticon]
  translation ? translation : "Sorry, that emoticon was not found"
end