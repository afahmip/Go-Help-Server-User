module DistanceHelper

  EARTH_RADIUS = 6371
  DISTANCE_LIMIT = 5000.0

  def DistanceHelper.init_location(lat, lon)
    [lat, lon]
  end

  def DistanceHelper.get_distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rm = EARTH_RADIUS * 1000    # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def DistanceHelper.is_helper_close_to_user(distance)
    distance <= DISTANCE_LIMIT
  end

end