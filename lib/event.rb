class Event < ActiveRecord::Base

  has_many :notes, :as => :noteable

  def self.list_by_date
    Event.where(:start_date => Time.now..'2400/01/01 12:00:00').sort_by_date
  end

  def self.view_day(attributes = {:year => Time.now.year, :month => Time.now.month, :day => Time.now.day})
    today = Date.new(attributes[:year], attributes[:month], attributes[:day])
    Event.where(:start_date => "#{today.convert_to_sql}").sort_by_date
  end

  def self.view_month(attributes = {:month => Time.now.month, :year => Time.now.year})
    target_month = Date.new(attributes[:year], attributes[:month], 1)
    Event.where(:start_date => "#{target_month.convert_to_sql}".."#{(target_month >> 1).convert_to_sql}").sort_by_date
  end

  def self.view_year (attributes = {:year => Time.now.year})
    target_year = Date.new(attributes[:year], 1, 1)
    Event.where(:start_date => "#{target_year.convert_to_sql}".."#{(target_year + 365).convert_to_sql}").sort_by_date
  end
end
