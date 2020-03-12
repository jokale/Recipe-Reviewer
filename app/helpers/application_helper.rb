module ApplicationHelper

    def render_nav_bar
        if logged_in?
          render partial: 'layouts/login_links'
        else
          render partial: 'layouts/logout_links'
        end
      end

end
