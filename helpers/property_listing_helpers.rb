module PropertyListingHelpers

  def summary_gallery_for(property)
    content_tag(:div, class: 'thumbs') do
      property.images.take(3).map do |img_path|
        link_to(img_path, class: 'th') do
          image_tag img_path
        end
      end.join('')
    end
  end

end
