class Event < ActiveRecord::Base
  def self.list_by_date
    Event.where(:start_date => Time.now..'2400/01/01 12:00:00').sort { |a,b| a.start_date <=> b.start_date }
  end

  def self.view_day
    today = Time.now.strftime("%Y/%m/%d")
    Event.where(:start_date => "#{today} 00:00:00".."#{today} 24:00:00")
  end

  def self.view_month
    current_month = Time.now.strftime("%Y")
    start_date = Time.now.strftime("%Y/%m") + "/1"
    next_month = Time.now.month.next
    end_date = current_month + "/#{next_month}/1"
    Event.where(:start_date => "#{start_date} 00:00:00".."#{end_date} 00:00:00").sort { |a,b| a.start_date <=> b.start_date }
  end

  def self.view_year
    current_year = Time.now.strftime("%Y")
    start_date = current_year + "/01/01 00:00:00"
    end_date = current_year.next + "/01/01 00:00:00"
    Event.where(:start_date => "#{start_date}".."#{end_date}")
  end

end
