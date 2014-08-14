class Array
  def sort_by_date
    self.sort { |a,b| a.start_date <=> b.start_date }
  end
end

class Time
  def convert_to_date
    Date.new(self.year, self.month, self.day)
  end
end

class Date
  def convert_to_sql
    "#{self.year}/#{self.month}/#{self.day} 00:00:00"
  end
end
