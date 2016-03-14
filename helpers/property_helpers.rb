module PropertyHelpers

  def slideshow_for(property)
    images = property.images
    path = current_path.split('/')[0..-2]

    content_tag(:div, class: 'ss-slides') do
      images.map do |img|

        opts = { class: 'ss-slide' }
        opts[:class] += ' hide' unless img == images.first

        image_tag(File.join(path, 'images', img), opts)

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
    path = current_path.split('/')[0..-2]
    property.images.map do |img|
      content_tag(:li) do |li|
        link_to('', class: 'th') do
          image_tag(File.join(path, 'images', img))
        end
      end
    end.join('')
  end

end
