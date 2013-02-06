require 'emotidragon/eastern'

module Emotidragon #http://en.wikipedia.org/wiki/List_of_emoticons
  autoload :Eastern, 'emotidragon/eastern'

  POSITIVE_EMOTICONS = /\|?>?[:*;Xx8=]-?o?\^?[DPpb3)}\]>]\)?/
  NEGATIVE_EMOTICONS = /([:><].?-?[@><cC(\[{\|]\|?|[D][:8;=X]<?|v.v)/

  #gets an array of all matching emoticons in the text
  def emoticons
    (positive_emoticons + negative_emoticons)
  end

  #gets an array of the matching positive emoticons in the text
  def positive_emoticons
    self.scan(POSITIVE_EMOTICONS).flatten
  end

  #gets an array of the matching negative emoticons in the text
  def negative_emoticons
    self.scan(NEGATIVE_EMOTICONS).flatten
  end

  #contains any emoticon?
  def emoticon?
    (positive_emoticon? || negative_emoticon?)
  end

  #checks if the text has a positive emoticon
  def positive_emoticon?
    self =~ POSITIVE_EMOTICONS
  end

  #checks if the text has a negative emoticon
  def negative_emoticon?
    self =~ NEGATIVE_EMOTICONS
  end

  #get total number of emoticons
  def number_of_emoticons
    positive_count + negative_count
  end

  #number of positive emoticons
  def positive_count
    positive_emoticons.count
  end

  #number of negative emoticons
  def negative_count
    negative_emoticons.count
  end

  #sentiment based on emoticons
  def text_sentiment
    count = positive_emoticons.count - negative_emoticons.count
    if count > 0
      "positive"
    elsif count < 0
      "negative"
    else
      "neutral"
    end
  end

  #gets more info regarding the sentiment of the text
  def sentiment_info
    pos_count, neg_count = positive_count, negative_count
    count = pos_count - neg_count
    if count > 0
      Emotidragon.score_hash("positive", pos_count, neg_count, count)
    elsif count < 0
      Emotidragon.score_hash("negative", pos_count, neg_count, count)
    else
      Emotidragon.score_hash("neutral", pos_count, neg_count, count)
    end
  end

  #include Emotidragon into String class
  String.send(:include, Emotidragon)

  private

  #hash returned that contains information regarding text
  def self.score_hash(sentiment, pos_count, neg_count, count)
    { sentiment: sentiment, positive_count: pos_count, negative_count: neg_count, difference: count.abs }
  end
end
