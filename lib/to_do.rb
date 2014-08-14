class ToDo < ActiveRecord::Base
  has_many :notes, :as => :noteable
end
