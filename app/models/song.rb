class Song < ApplicationRecord
  validates(:title, {presence: true})
  # validates :release_year, presence: true, if: :released?
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
  end

  validates :title, uniqueness: {scope: [:artist_name, :release_year]}

  def released?
    self.released
  end
end
