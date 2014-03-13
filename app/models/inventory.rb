class Inventory < ActiveRecord::Base
	belongs_to :event
	belongs_to :part
end
