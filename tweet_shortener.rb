require 'pry'

def dictionary
  conv = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    'be' => "b",
    'you' => "u",
    "at" => "@",
    "and" => "&"
  }
end

# replaces long words with their expected short form
def word_substituter(string)
    string.split(" ").collect do |word|
      if dictionary.keys.include?(word.downcase)
        word = dictionary[word.downcase]
      else
        word
    end
  end.join(" ")
end

# shortens each tweet and prints the results 
def bulk_tweet_shortener(array)
  array.collect do |tweet|
    puts word_substituter(tweet)
  end
end

# shortens tweets that are more than 140 characters 
def selective_tweet_shortener(tweet)
  tweet.split(" ").map do |phrase|
    if phrase.length > 140
      word_substituter(phrase)
    elsif phrase.length <= 140
      phrase
    end
  end
end

def shortened_tweet_truncator(tweet)
  tweet.split(" ").collect do |phrase|
    if phrase.length > 140 
      word_substituter(phrase[0...140]) + "..."
    else
      phrase
      binding.pry
    end
  end.join(" ")
end

