module ApplicationHelper

  def stars_to_s(value)
    if value.is_a? Integer
      "&#9733" * value + "&#9734" * (5 - value)
    else
      value
    end
  end
end
