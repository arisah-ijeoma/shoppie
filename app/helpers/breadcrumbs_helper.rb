module BreadcrumbsHelper
  def ensure_navigation
    @navigation ||= [{ title: 'Home', url: '/' }]
  end

  def navigation_add(title, url)
    ensure_navigation << { title: title, url: url }
  end

  def render_navigation
    render partial: 'shared/navigation', locals: { nav: ensure_navigation }
  end
end
