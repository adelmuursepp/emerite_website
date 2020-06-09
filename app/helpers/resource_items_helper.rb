
# create custom tags for redcarpet to insert youtube|vimeo iframes in
# your document.
# ::usage:: vid(youtube, 123456)

module ResourceItemsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", class: 'img-fluid'
  end

  def resource_item_status_color resource_item
    'color: #d9534f;' if resource_item.draft?
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      if code and language
        CodeRay.scan(code, language).div
      end
    end
    def autolink(link, link_type)
      case link_type
        when :url then url_link(link)
        when :email then email_link(link)
      end
    end
    def url_link(link)
      case link
        when /^https:\/\/repl/ then repl_link(link)
        else normal_link(link)
      end
    end
    def repl_link(link)
      print('repl link here')
      parameters_start = link.index('?')
      video_id = link[16..(parameters_start ? parameters_start-1 : -1)]
      "<iframe width=\"560\" height=\"315\" src=\"//https://repl.it/repls/#{video_id}?\" frameborder=\"0\"></iframe>"
    end
    def normal_link(link)
      "<a href=\"#{link}\">#{link}</a>"
    end
    def email_link(email)
      "<a href=\"mailto:#{email}\">#{email}</a>"
    end
  end


  def markdown(text)
    coderayified = CodeRayify.new(escape_html: true, hard_wrap: true, with_toc_data: true)

    options = {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      disable_indented_code_blocks: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      lax_html_blocks: true,
      with_toc_data: true

    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)

    markdown_to_html.render(text).html_safe
  end
end
