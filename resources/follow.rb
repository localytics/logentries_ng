actions :set, :add, :remove, :clean
default_action :add

attribute :name, :kind_of => [String, NilClass], :name_attribute => true
attribute :user, :kind_of => [String, NilClass], :default => "root"
attribute :logs, :kind_of => [Array, NilClass], :default => nil
attribute :log_file, :kind_of => [String, NilClass], :default => nil
attribute :log_type, :kind_of => [String, NilClass], :default => nil
