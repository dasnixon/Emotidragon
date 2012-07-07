class Emotidragon
  def contains_happy_emoticon?(text)
    /\|?>?[:*;Xx8=]-?o?\^?[DPpb3)}\]>]\)?/.match(text) ? true : false
  end

  def contains_sad_emoticon?(text)
    /([:><].?-?[@><cC(\[{\|]\|?|[D][:8;=X]<?|v.v)/.match(text) ? true : false
  end

  def ranking_sentiment_of_text(text)
    pos_count, neg_count = text.scan(/\|?>?[:*;Xx8=]-?o?\^?[DPpb3)}\]>]\)?/).count, text.scan(/([:><].?-?[@><cC(\[{\|]\|?|[D][:8;=X]<?|v.v)/).count
    total_count = pos_count - neg_count
    if total_count > 0
      return { :sentiment => "positive", :num_pos_matches => pos_count, :num_neg_matches => neg_count, :score => total_count }
    elsif total_count == 0
      return { :sentiment => "neutral", :num_pos_matches => pos_count, :num_neg_matches => neg_count, :score => 0 }
    else
      return { :sentiment => "negative", :num_pos_matches => pos_count, :num_neg_matches => neg_count, :score => total_count }
    end
  end
end
