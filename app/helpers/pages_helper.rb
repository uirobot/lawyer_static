module PagesHelper
  def get_bread_crumbs(page)
    if page.parent
      "#{link_to('Главная', root_path)}  #{link_to page.parent.name, pages_full_path(page.parent.permalink, page.parent.permalink)}  #{page.name}".html_safe
    else
      "#{link_to('Главная', root_path)}  #{page.name}".html_safe
    end
  end
end
