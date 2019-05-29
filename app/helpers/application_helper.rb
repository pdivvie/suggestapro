module ApplicationHelper
  ## commented code is redundant in current version. Keeping for now incase

  # def login_helper style = ''
  #   if current_user.is_a?(GuestUser)
  #     (link_to "Register", new_user_registration_path,class: style) +
  #     " ".html_safe +
  #     (link_to "Login", new_user_session_path,class: style)
  #   else
  #     (link_to "Create a business page", new_business_path,class: style) +
  #     " ".html_safe +
  #     (link_to "My Services", my_services_path,class: style) +
  #     " ".html_safe +
  #     (link_to "My Reviews", ratings_path,class: style) +
  #     " ".html_safe +
  #     (link_to "Logout", destroy_user_session_path, method: :delete,class: style) 
  #   end
  # end

  # def nav_items
  #   [
  #     {
  #       url: root_path,
  #       title: 'Home'
  #     },
  #     {
  #       url: businesses_path,
  #       title: 'Businesses'
  #     }
  #   ]
  # end

  # def nav_helper style, tag_type

  #   nav_links = ''

  #   nav_items.each do |item|
  #     nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
  #   end

  #   nav_links.html_safe
  # end

  # def active? path
  #   "active" if current_page? path
  # end

  def search_bar
    form_for "",url: businesses_path, role: "search", method: :get do
      text_field_tag :search, @search_term,placeholder: "Search..."
    end
  end

end
