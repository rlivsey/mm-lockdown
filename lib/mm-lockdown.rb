require 'mongo_mapper'

module MongoMapper
  module Plugins
    module Lockdown
      extend ActiveSupport::Concern

      module InstanceMethods
        protected
        def filter_inaccessible_attrs(attrs)
          return attrs if attrs.blank?
          allowed = self.keys.keys
          attrs.dup.delete_if { |key, val| !allowed.include?(key.to_s) }
        end
      end
    end
  end
end