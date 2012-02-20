require 'redmine'
require 'format_selector_wiki_formatting_patch'

Redmine::Plugin.register :redmine_format_selector do
  name 'Redmine Format Selector plugin'
  author 'OZAWA Yasuhiro'
  description 'Selecting wiki format'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_format_selector'
end
