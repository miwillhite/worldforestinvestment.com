module PropertyHelpers

  def slideshow_for(property)
    images = property.images
    path = current_path.split('/')[0..-2]

    content_tag(:div, class: 'ss-slides') do
      images.map do |img_path|

        opts = { class: 'ss-slide' }
        opts[:class] += ' hide' unless img_path == images.first

        image_tag(img_path, opts)

      end.join('')
    end
  end

  def document_list_for(property)
    documents = property.documents

    documents.map do |doc|
      content_tag(:li) do |li|
        link_to(doc.title, doc.href)
      end
    end.join('')
  end

  def gallery_for(property)
    property.images.map do |img_path|
      content_tag(:li) do |li|
        link_to('', class: 'th') do
          image_tag(img_path)
        end
      end
    end.join('')
  end

end
