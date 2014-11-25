actions :install_and_register, :install, :register, :unregister, :clean, :rm
default_action :install_and_register

attribute :name, :kind_of => [String, NilClass], :name_attribute => true
attribute :account_key, :kind_of => [String, NilClass], :default => nil
attribute :host_key, :kind_of => [String, NilClass], :default => nil
attribute :force, :kind_of => [String, NilClass], :default => nil
attribute :ec2eu, :kind_of => [String, NilClass], :default => nil
attribute :suppress_ssl, :kind_of => [String, NilClass], :default => nil
attribute :yes, :kind_of => [String, NilClass], :default => nil
attribute :no_timestamps, :kind_of => [String, NilClass], :default => nil
attribute :user, :kind_of => [String, NilClass], :default => "root"
attribute :when, :kind_of => [String, NilClass], :default => nil
attribute :filter, :kind_of => [String, NilClass], :default => nil
attribute :limit, :kind_of => [String, NilClass], :default => nil
attribute :server_name, :kind_of => [String, NilClass], :default => nil
attribute :hostname, :kind_of => [String, NilClass], :default => nil
attribute :entity, :kind_of => [String, NilClass], :default => nil
