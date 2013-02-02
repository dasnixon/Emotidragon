require 'spec_helper'

describe Emotidragon do
  let(:positive_string) { 'This is a positive :) string' }
  let(:negative_string) { 'This is a negative :( string' }
  let(:neutral_string)  { 'This is a neutral string' }
  let(:emoticon_string) { 'This contains :) and :( emoticons. :o) :*(' }

  describe '#emoticons' do
    context 'emoticons present' do
      it('returns all positive and negative emoticons') { emoticon_string.emoticons.should =~ [':)', ':(', ':o)', ':*('] }
    end
    context 'no emoticons' do
      it('returns empty array') { neutral_string.emoticons.should == [] }
    end
  end

  describe '#positive_emoticons' do
    context 'positive emoticons' do
      it('returns all positive') { emoticon_string.positive_emoticons.should =~ [':)', ':o)'] }
    end
    context 'no positive emoticons, just negative' do
      it('should not return any negative') { emoticon_string.positive_emoticons.should_not == [':(', ':*('] }
    end
    context 'no emoticons' do
      it('returns empty array') { neutral_string.positive_emoticons.should == [] }
    end
  end

  describe '#negative_emoticons' do
    context 'negative emoticons' do
      it('returns all negative') { emoticon_string.negative_emoticons.should =~ [':(', ':*('] }
    end
    context 'no negative emoticons, just positive' do
      it('should not return any positive') { emoticon_string.negative_emoticons.should_not == [':)', ':o)'] }
    end
    context 'no emoticons' do
      it('returns empty array') { neutral_string.negative_emoticons.should == [] }
    end
  end

  describe '#emoticon?' do
    context 'both' do
      it('returns true') { emoticon_string.emoticon?.should be_true }
    end
    context 'just positive' do
      it('returns true') { positive_string.emoticon?.should be_true }
    end
    context 'just negative' do
      it('returns true') { negative_string.emoticon?.should be_true }
    end
    context 'neither' do
      it('returns false') { neutral_string.emoticon?.should be_false }
    end
  end

  describe '#positive_emoticon?' do
    context 'text contains a positive emoticon' do
      it('returns true') { positive_string.positive_emoticon?.should be_true }
    end
    context 'text does not contain a positive emoticon' do
      it('returns true') { negative_string.positive_emoticon?.should be_false }
    end
    context 'neither' do
      it('returns false') { neutral_string.positive_emoticon?.should be_false }
    end
  end

  describe '#negative_emoticon?' do
    context 'text contains a negative emoticon' do
      it('returns true') { negative_string.negative_emoticon?.should be_true }
    end
    context 'text does not contain a negative emoticon' do
      it('returns true') { positive_string.negative_emoticon?.should be_false }
    end
    context 'neither' do
      it('returns false') { neutral_string.negative_emoticon?.should be_false }
    end
  end

  describe '#number_of_emoticons' do
    it('returns the count') { emoticon_string.number_of_emoticons.should == 4 }
    it('returns the count') { positive_string.number_of_emoticons.should == 1 }
    it('returns the count') { negative_string.number_of_emoticons.should == 1 }
    it('returns the count') { neutral_string.number_of_emoticons.should == 0 }
  end

  describe '#positive_count' do
    context 'text contains positive emoticon' do
      it('returns the count') { positive_string.positive_count.should == 1 }
      it('returns the count') { emoticon_string.positive_count.should == 2 }
    end
    context 'text does not contain a positive emoticon' do
      it('returns the count') { neutral_string.positive_count.should == 0 }
    end
  end

  describe '#negative_count' do
    context 'text contains positive emoticon' do
      it('returns the count') { negative_string.negative_count.should == 1 }
      it('returns the count') { emoticon_string.negative_count.should == 2 }
    end
    context 'text does not contain a positive emoticon' do
      it('returns the count') { neutral_string.negative_count.should == 0 }
    end
  end

  describe '#text_sentiment' do
    context 'positive' do
      it('returns "positive"') { positive_string.text_sentiment.should == "positive" }
    end
    context 'negative' do
      it('returns "negative"') { negative_string.text_sentiment.should == "negative" }
    end
    context 'neutral' do
      it('returns "neutral"') { emoticon_string.text_sentiment.should == "neutral" }
    end
  end

  describe '#sentiment_info' do
    context 'positive count' do
      it 'returns hash containing positive' do
        positive_string.sentiment_info.should == { sentiment: "positive", positive_count: 1, negative_count: 0, difference: 1 }
      end
    end
    context 'negative count' do
      it 'returns hash containing negative' do
        negative_string.sentiment_info.should == { sentiment: "negative", positive_count: 0, negative_count: 1, difference: 1 }
      end
    end
    context 'neutral count' do
      it 'returns hash containing neutral' do
        neutral_string.sentiment_info.should == { sentiment: "neutral", positive_count: 0, negative_count: 0, difference: 0 }
      end
    end
  end

  describe '#score_hash' do
    let(:sentiment)  { "sentiment" }
    let(:pos_count)  { Random.rand(0...10) }
    let(:neg_count)  { Random.rand(0...10) }
    let(:difference) { (pos_count - neg_count).abs }
    it 'returns hash of what is passed in' do
      Emotidragon.score_hash(sentiment, pos_count, neg_count, difference).should == { sentiment: sentiment, positive_count: pos_count, negative_count: neg_count, difference: difference }
    end
  end
end
