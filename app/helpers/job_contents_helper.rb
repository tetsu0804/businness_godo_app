module JobContentsHelper
  def year_month(month, count)
     y = month.slice(0,4)
     m = month.slice(4,2)
     ym =  "#{y}年#{m}月"
     return "#{ym} (#{count})"
  end
end
