require 'spec_helper'

describe Emotidragon::Eastern do
  describe '#talk' do
    let(:word) { 'hello'}

    it('should puts hello') {word.talk.should  == word}
  end
end
