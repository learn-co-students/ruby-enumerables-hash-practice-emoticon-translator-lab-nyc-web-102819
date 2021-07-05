require "yaml"

def load_library(path)
  emojis = YAML.load_file(path)
  sorted_list = emojis.reduce({}) do
    |memo, (definition, emoticons)|
    if !memo[:get_meaning]
      memo[:get_meaning] = {}
    end
    if !memo[:get_emoticon]
      memo[:get_emoticon] = {}
    end
    emoticons.each do
      |emoji|
      memo[:get_meaning][emoji] = definition.to_s
    end
    if !memo[:get_emoticon][emoticons[0]]
        memo[:get_emoticon][emoticons[0]] = []
    end
    memo[:get_emoticon][emoticons[0]] = emoticons[1]
    memo
  end 
  sorted_list
end

def get_japanese_emoticon (path, emoji) 
  emoji_list = load_library(path)
  equivalent_emoji = emoji_list[:get_emoticon][emoji]
  if !equivalent_emoji
    equivalent_emoji = "Sorry, that emoticon was not found"
  end
  equivalent_emoji
end

def get_english_meaning (path, emoji) 
  emoji_list = load_library(path)
  equivalent_emoji = emoji_list[:get_meaning][emoji]
  if !equivalent_emoji
    equivalent_emoji = "Sorry, that emoticon was not found"
  end
  equivalent_emoji
end