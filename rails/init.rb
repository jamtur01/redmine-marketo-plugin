require 'redmine'

require_dependency 'marketo_hooks'

Redmine::Plugin.register :marketo_plugin do
  name 'Marketo plugin'
  author 'James Turnbull'
  description 'Redmine plugin to insert the Marketo tracking code into Redmine based on user roles.'
  url 'https://github.com/jamtur01/redmine-marketo-plugin'
  author_url 'http://www.littlestreamsoftware.com'
  
  version '0.1.0'
  
  requires_redmine :version_or_higher => '0.8.0'
  
  settings :default => {
    'marketo_code' => '',
    'marketo_log_anonymous' => true,
    'marketo_log_authenticated' => true,
    'marketo_log_administrator' => true
  }, :partial => 'settings/marketo_settings'


end

