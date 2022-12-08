class Turbine < ApplicationRecord
  has_many :outputs, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :maximum_power, :rotor_diameter, numericality: {greater_than: 0, allow_nil: true }
  validates :tower_height, :max_wind_speed, :min_wind_speed, numericality: {greater_than: 0, allow_nil: false }
  validates :blades, numericality: {greater_than: 1, allow_nil: false }
  validates :name, presence: true

  after_initialize  { p "initialize"}
  after_save        { p "save"}
  after_create      { p "create"}
  after_update      { p "update"}
  after_destroy     { p "destroy"}
end
