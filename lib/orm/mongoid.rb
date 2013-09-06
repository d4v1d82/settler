class Setting

	include Mongoid::Document
	include Mongoid::Timestamps

	field :key, :type=>String
	field :label, :type=>String
	field :value, :type=>String
	field :editable, :type=>Boolean
	field :deletable, :type=>Boolean
	field :deleted, :type=>Boolean, default: false

	default_scope lambda{ where(deleted: false) }

	scope :editable, lambda { where editable: true }
	scope :deletable, lambda { where deletable: true }


	def self.find_by_key(value)
		where(:key=>value).first
	end

	def self.order(*args)
		self.order_by(args)
	end

	def destroy
		if deletable?
			item = Setting.where(:id => self.id).update_all(:deleted => true)
			self.deleted = true
			deleted?
		else
			false
		end
	end

	def deleted?
		!!self.deleted
	end

	def self.all_keys(options={})
		order = options[:order]
		order ||= 'key'
		order = "#{order} ASC" if !order.match(/ASC$/) && !order.match(/DESC$/)

		Setting.order_by(order).all.pluck(:key)
	end

end