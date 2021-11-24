class Movie < ApplicationRecord
  belongs_to :owner, class_name: "User" # movie.owner
  has_many :bookings
  has_one_attached :photo

  scope :jurassic, -> { where("title ILike ?", '%jurassic%') }

  validates :title, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
