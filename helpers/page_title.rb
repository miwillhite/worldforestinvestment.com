module PageTitle

  def page_title(title)
    site_name = 'World Forest Investment Inc.'
    title ? [title, site_name].join(' | ') : site_name
  end

end
