module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Freelance Jobs"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def datetime_format(datetime)
    datetime.in_time_zone("Asia/Manila").strftime("%B %-d, %Y, %I:%M %p")
  end

end
