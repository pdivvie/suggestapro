module BusinessesHelper

  def business_img img
    if img
      img
    else
      "http://demo.warptheme.com/images/placeholder_600x400.svg"
    end
  end
end
