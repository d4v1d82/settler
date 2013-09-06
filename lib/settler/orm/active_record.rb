class Setting < ActiveRecord::Base

	serialize :value
	cattr_accessor :rails3
  	self.rails3 = defined?(ActiveRecord::VERSION) && ActiveRecord::VERSION::MAJOR >= 3

	if self.rails3
		default_scope lambda{ where(['deleted = ? or deleted IS NULL', false]) }
	else
		#validate_on_update(:ensure_editable)
		default_scope :conditions => ['deleted = ? or deleted IS NULL', false]
	end

	scope_method = self.rails3 ? :scope : :named_scope
	send scope_method, :editable, lambda { where editable: true }
	send scope_method, :deletable, lambda { where deletable: true }

	  # Performs a soft delete of the setting if this setting is deletable. This ensures this setting is not recreated from the configuraiton file.
  # Returns false if the setting could not be destroyed.
  def destroy    
    if deletable?       
      self.deleted = true if Setting.where(:id => self.id).update_all(:deleted => true)
      deleted?
    else 
      false
    end
  end

  def self.all_keys(options={})
  	Setting.order(options[:order]).select(:key).map(&:key)
  end
end