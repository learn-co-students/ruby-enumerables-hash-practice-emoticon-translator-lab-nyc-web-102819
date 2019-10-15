# require modules here
require "yaml"

def load_library(file_path)
  emojis = YAML.load_file(file_path)
  new_hash = {}
  new_hash['get_meaning'] = {}
  new_hash['get_emoticon'] = {}
  emojis.each do |key, items|
    new_hash['get_meaning'][items[1]] = key.to_s
    new_hash['get_emoticon'][items[0]] = items[1]
  end
  puts new_hash
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_library = load_library(file_path)
  if emoji_library["get_emoticon"][emoticon]
    japanese_emoji = emoji_library["get_emoticon"][emoticon]
    return japanese_emoji
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoji_library = load_library(file_path)
  if emoji_library["get_meaning"][emoticon]
    english_meaning = emoji_library["get_meaning"][emoticon]
    return english_meaning
  else
    return "Sorry, that emoticon was not found"
  end
end