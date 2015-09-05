module ApplicationHelper
  def admin_button(text, url, options={})
    content_for(:admin_buttons) do
      content_tag(:li) do
        link_to(text, url, options)
      end
    end
  end
end
