module FontAwesomeHelper
  def font_awesome_kit_url
    ENV['FONT_AWESOME_URL'] || 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js'
  end

  def icon(icon, variant="s", *options)
    content_tag(:i, '', class: [
      'fa-fw',
      "fa#{variant}",
      "fa-#{icon}",
      *options
      ]).html_safe
  end

  def icon_text(icon, text, variant="s", *options)
    (content_tag(:i, '', class: [
      'fa-fw',
      "fa#{variant}",
      "fa-#{icon}",
      *options
      ]).html_safe + ' &nbsp;'.html_safe + text.html_safe)
  end
end