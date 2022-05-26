module ImageHelper
  def image_type
    if image.attached?
      if image.blob.content_type.include?('image')
        true
      else
        errors.add(:image, 'must be an image')
        false
      end
    else
      true
    end
  end

  def image_size
    if image.attached?
      if image.blob.byte_size < 5.megabytes
        true
      else
        errors.add(:image, 'must be less than 5MB')
        false
      end
    else
      true
    end
  end
end
