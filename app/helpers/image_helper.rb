module ImageHelper
    def image_type
        if image.attached?
        if image.blob.content_type.include?('image')
            return true
        else
            errors.add(:image, 'must be an image')
            return false
        end
        else
        return true
        end
    end

    def image_size
        if image.attached?
        if image.blob.byte_size < 5.megabytes
            return true
        else
            errors.add(:image, 'must be less than 5MB')
            return false
        end
        else
        return true
        end
    end
end