module ApplicationHelper
  def image_default(cocktail)
    if cocktail.photo.url
      cl_image_path cocktail.photo, crop: :fill
    else
      image_path 'logo.ico'
    end
  end
end
