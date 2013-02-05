# Emotidragon: Emoticons! ROAR!

[Rubygems](https://rubygems.org/gems/emotidragon)
[Rubydoc](http://rubydoc.info/github/liamneesonsarm/Emotidragon/master/frames)

Emotidragon acts on String objects to help ruby devs work with emoticons, what can you do: 

 * get an array of all emoticons
 * get an array of just positive/negative emoticons
 * get sentiment of the text based on emoticons
 * determine if string contains an emoticon
 * determine if string contains just positive/negative emoticon
 * get number of emoticons
 * get number of positive/negative emoitcons
 * get sentiment of text based on sentiment of emoticons
 * get an informative hash of sentiment, number of positive emoticons, number of negative emoticons,and difference between the number of emoticons

## I always wanted to ride a dragon myself, so I decided to do this for a year in my imagination.

Use RubyGems to install emotidragon

    $ gem install emotidragon 

## Method List
### emoticons - get array of all emoticons
    "I love science :). I hate nickelback :(".emoticions
    -> [":)", ":("]

### positive_emoticons - get array of positive emoticons
    "I love science :). I hate nickelback :(".positive_emoticions
    -> [":)"]

### negative_emoticons - get array of negative emoticons
    "I love science :). I hate nickelback :(".positive_emoticions
    -> [":("]
    
### emoticon? - determine if string contains an emoticon
    "i love science :). i hate nickelback :(".emoticion?
    -> true

### positive_emoticon? - determine if string contains positive emoticon
    "I love science :)".positive_emoticion?
    -> true

    "I hate nickelback :(".positive_emoticion?
    -> false

### negative_emoticon? - determine if string contains negative emoticon
    "I hate nickelback :(".negative_emoticion?
    -> true

    "I love science :)".negative_emoticion?
    -> false

### number_of_emoticon - get total number of emoticonss
    "i love science :). i hate nickelback :(".number_of_emoticons
    -> 2

### positive_count - get number of positive emoticons
    "i love science :). i hate nickelback :(".positive_count
    -> 1

### negative_count - get number of negative emoticons
    "i love science :). i hate nickelback :(".negative_count
    -> 1

### text_sentiment - get sentiment of text
    "I love science :). I hate nickelback :(".text_sentiment
    -> "neutral

    "I love science :)".text_sentiment
    -> "positive"

    "I hate nickelback :(".text_sentiment
    -> "negative"

### sentiment_info - get a hash of information about the text (sentiment, # of positive emoticons, # of negative emoticons, difference)
    "I love science :). I hate nickelback :(".sentiment_info
    -> { :sentiment => "neutral", :positive_count => 1, :negative_count => 1, :difference => 0 }

    "I love science :)".sentiment_info
    -> { :sentiment => "neutral", :positive_count => 1, :negative_count => 0, :difference => 1 }

    "I hate nickelback :(".sentiment_info
    -> { :sentiment => "neutral", :positive_count => 0, :negative_count => 1, :difference => 1 }

### Dependencies

Just rspec, for science and testing!
