module PropertyHelpers

  def slideshow_for(property)
    images = property.images

    content_tag(:div, class: 'ss-slides') do
      images.map do |img|

        opts = { class: 'ss-slide' }
        opts[:class] += ' hide' unless img == images.first

        path = current_path.split('/')[0..-2]

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

  def gallery(property)
  end

end
