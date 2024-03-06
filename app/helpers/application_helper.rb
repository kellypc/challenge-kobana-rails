module ApplicationHelper
  def formatted_date(date)
    return if date.blank?
    
    Date.parse(date.to_s).strftime('%d/%m/%Y')
  end
end
