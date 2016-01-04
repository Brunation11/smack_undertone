module ApplicationHelper
  def user_profile_date(d)
    return "" unless d
    d.strftime("%b %e, %Y")
  end

  def question_datetime(d)
    return "" unless d
    d.strftime("%b %e\'%y at %l:%M")
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(line_numbers: :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
      tables: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
