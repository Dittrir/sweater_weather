class Background
  attr_reader :id, :image, :location, :image_url, :credit

  def initialize(data, location)
    @id = nil
    @data = data
    @image = image
    @location = location
    @image_url = data[:results][0][:urls][:raw]
    @credit = {:source => "unsplash.com",
               :author => data[:results][0][:user][:name],
               :logo => data[:results][0][:urls][:thumb]}
  end

  def image
    {
      :location => @location,
      :image_url => @image_url,
      :credit => @credit
    }
  end
end
