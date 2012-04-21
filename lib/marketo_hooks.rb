# This class hooks into Redmine's View Listeners in order to
# add content to the page
class MarketoHooks  < Redmine::Hook::ViewListener

  # Adds the Marketo code to the layout if the current user meets
  # the conditions setup by the System Administrator
  def view_layouts_base_body_bottom(context = { })
    log_anon = Setting.plugin_marketo_plugin['marketo_log_anonymous']
    log_auth = Setting.plugin_marketo_plugin['marketo_log_authenticated']
    log_admin = Setting.plugin_marketo_plugin['marketo_log_administrator']

    if (User.current.anonymous? && log_anon) || # Anon user
        (User.current.logged? && log_auth && !User.current.admin?) || # Auth users who are not admins
        (User.current.admin? && log_admin) # Admin user
      return Setting.plugin_marketo_plugin['marketo_code']
    else
      return ''
    end
  end
end
