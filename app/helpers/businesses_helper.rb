module BusinessesHelper

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def business_img img
    if img
      img
    else
      image_generator(height: '480', width: '360')
    end
  end
end
