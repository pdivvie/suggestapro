module BusinessesHelper

  def business_img img
    if img
      img
    else
      'https://rating-site-bucket.s3.eu-west-2.amazonaws.com/uploads/business/placeholder/placeholder_600x400.svg'
    end
  end
end
