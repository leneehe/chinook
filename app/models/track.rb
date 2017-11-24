class Track < ApplicationRecord

  SHORT = 180_000
  LONG = 360_000

  def self.short
    shorter_than(SHORT)
  end

  def self.medium
    longer_or_equal_to(SHORT).shorter_than(LONG)
  end

  def self.long
    longer_or_equal_to(LONG)
  end

  def self.shorter_than(milliseconds)
    if milliseconds && milliseconds > 0
      where("milliseconds < ?", milliseconds)
    else
      all
    end
  end

  def self.longer_or_equal_to(milliseconds)
    if milliseconds && milliseconds > 0
      where("milliseconds > ?", milliseconds)
    else
      all
    end
  end

  def self.starts_with(char)
    where('name ILIKE ?', "#{ char }%")
  end

end
