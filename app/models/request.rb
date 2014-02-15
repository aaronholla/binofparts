class Request < ActiveRecord::Base
	belongs_to :team
	belongs_to :event
	validates_inclusion_of :year, :in => [2013, 2012, 2011, 2010, 2009], :allow_nil => false
end
