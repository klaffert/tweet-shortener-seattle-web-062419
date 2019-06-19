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
# does not shorten tweets that are less than 130 characters
def selective_tweet_shortener(tweet)
  if tweet.length > 140 
    word_substituter(tweet)
  else 
    tweet 
  end 
end 

# truncates tweets over 140 characters after shortening
# does not shorten tweets shorter than 140 characters
def shortened_tweet_truncator(tweet)
  if selective_tweet_shortener(tweet).length > 140 
    selective_tweet_shortener(tweet)[0..136] + '...'
  else 
    tweet 
  end 
end 

