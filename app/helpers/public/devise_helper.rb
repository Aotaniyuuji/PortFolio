module Public::DeviseHelper
  def bootstrap_alert(key)
    case key
      when "alert"
        "danger"
      when "notice"
        "info"
    else
      key
    end
  end
end