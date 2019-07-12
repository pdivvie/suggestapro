module ApplicationHelper

  def search_bar
    form_for "",url: businesses_path, role: "search", method: :get do
      text_field_tag :search, @search_term,placeholder: "Search..."
    end
  end

  def alerts
    alert = flash[:alert] || flash[:error] || flash[:notice]

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, on_click: remove_gritter, :nodom_wrap  => true )
  end

end
