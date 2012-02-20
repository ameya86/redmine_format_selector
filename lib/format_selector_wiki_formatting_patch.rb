require_dependency 'redmine/wiki_formatting'

module FormatSelectorWikiFormattingPatch
  def self.included(base)
    base.extend(FormatSelectorWikiFormattingMethod)

    class << Redmine::WikiFormatting
      alias_method_chain :to_html, :format_selector
    end
  end

  module FormatSelectorWikiFormattingMethod
    def to_html_with_format_selector(format, text, options = {})
      new_format, content =  text.split(/\r?\n/, 2)
      new_format = format unless Redmine::WikiFormatting.format_names.include?(new_format)

      text = to_html_without_format_selector(new_format, content, options)
    end
  end
end

Redmine::WikiFormatting.send(:include, FormatSelectorWikiFormattingPatch)
