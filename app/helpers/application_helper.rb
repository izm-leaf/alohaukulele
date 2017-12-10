module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image_profile.png'
    end
    image_tag(img_url, alt: user.name)
  end

  def pict_img(ukulele)
    return image_tag(ukulele.image) if ukulele.image?
  end

end
