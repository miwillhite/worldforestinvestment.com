module PropertyListingHelpers

  def summary_gallery_for(property)
    content_tag(:div, class: 'thumbs') do
      path = current_path.split('/')[0..-2]
      property.images.take(3).map do |img|
        img_path = File.join(path, 'images', img)
        link_to(img_path, class: 'th') do
          image_tag img_path
        end
      end.join('')
    end
  end

end
