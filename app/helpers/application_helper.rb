module ApplicationHelper

  def self.display_date(date)
    date.strftime("%B %d, %Y")
  end

  def self.display_year(date)
    date.strftime("%Y")
  end

end
