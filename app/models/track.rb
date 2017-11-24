class Track < ApplicationRecord

  SHORT = 180_000
  LONG = 360_000


  validates :name, :composer, :milliseconds, :bytes, :unit_price, presence: true
  validates :milliseconds, :bytes, numericality: {
    only_integer: true, greater_than: 0
  }
  validates :unit_price, numericality: {
    greater_than_or_equal_to: 0.0
  }
  validate :name_must_be_titled

  scope :short, -> { shorter_than(SHORT) }
  scope :medium, -> { longer_or_equal_to(SHORT).shorter_than(LONG) }
  scope :long, -> { longer_or_equal_to(LONG) }
  scope :starts_with, -> (char) { where('name ILIKE ?', "#{char}%") }

  scope :shorter_than, -> (milliseconds) {
    where("milliseconds < ?", milliseconds) if milliseconds && milliseconds > 0
  }

  scope :longer_or_equal_to, -> (milliseconds) {
    where("milliseconds > ?", milliseconds) if milliseconds && milliseconds > 0
  }

private

  def name_must_be_titled
    #step 1 make sure there is name
    return unless name.present?
    #step 2 check that the first character is an uppercase letter
    first_char = name[0]
    first_char_is_not_upcased = (first_char != first_char.upcase)
    #step 3 Add an error if the first char is not uppercase
    errors.add(:name, 'must be capitalized') if first_char_is_not_upcased
  end

  # def self.short
  #   shorter_than(SHORT)
  # end

  # def self.medium
  #   longer_or_equal_to(SHORT).shorter_than(LONG)
  # end

  # def self.long
  #   longer_or_equal_to(LONG)
  # end

  # def self.shorter_than(milliseconds)
  #   if milliseconds && milliseconds > 0
  #     where("milliseconds < ?", milliseconds)
  #   else
  #     all
  #   end
  # end

  # def self.longer_or_equal_to(milliseconds)
  #   if milliseconds && milliseconds > 0
  #     where("milliseconds > ?", milliseconds)
  #   else
  #     all
  #   end
  # end

  # def self.starts_with(char)
  #   where('name ILIKE ?', "#{ char }%")
  # end

end
