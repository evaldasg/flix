module ApplicationHelper
  def page_title
    if content_for?(:title)
      content_tag(:title, "Top Animations - #{content_for(:title)}")
    else
      content_tag(:title, "Top Animations")
    end
  end

  def title(title)
    content_for(:title, title)
  end

  def nav_link_to(text, url)
    classes = ["button"]
    classes << 'active' if current_page?(url)
    link_to(text, url, class: classes.join(''))
  end
end
