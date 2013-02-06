module Emotidragon::Eastern
    def talk
      self
    end
  String.send(:include, Emotidragon::Eastern)
end
