class Roster::Chapter < ActiveRecord::Base
  include SerializedColumns
  has_many :counties
  has_many :positions
  has_many :people

  def time_zone
    @_tz ||= ActiveSupport::TimeZone[self.time_zone_raw]
  end

  serialized_accessor :config, :incidents_map_center_lat, :decimal
  serialized_accessor :config, :incidents_map_center_lng, :decimal
  serialized_accessor :config, :incidents_map_zoom, :integer
  serialized_accessor :config, :incidents_geocode_bounds, :string
  serialized_accessor :config, :incidents_resources_tracked, :string
  def incidents_resources_tracked_array
    self.incidents_resources_tracked.try(:split, ',')
  end
end
