module ApplicationHelper

  def self.onvert_date(date)
    Date.parse(date.to_s).strftime("%m/%d/%Y")
  end

  def self.display_date(date)
    date.strftime("%B %d, %Y")
  end

  def self.display_year(date)
    date.strftime("%Y")
  end

end
