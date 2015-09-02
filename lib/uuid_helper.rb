module UUIDHelper
	def self.included(base)
		base.before_create :generate_uid
	end
	def generate_uid()
		self.id = UUIDTools::UUID.timestamp_create.to_s
	end
end