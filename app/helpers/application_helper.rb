module ApplicationHelper
  def to_absalom_reckoning(date)
    year = date.year + 2700
    I18n.l(date, format: "%A %e %B #{year}")
  end
end
