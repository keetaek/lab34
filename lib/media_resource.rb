module MediaResource
  def acts_as_media
    include InstanceMethods
    
    has_one :medium, :as => :media_resource, :autosave => true, :dependent => :destroy
    alias_method_chain :medium, :build
    
    medium_attributes = Medium.content_columns.map(&:name)
    
    def medium_attr_accessor(*attribute_array)
      attribute_array.each do |att|
        define_method(att) do
          medium.send(att)
        end
        define_method("#{att}=") do |val|
          medium.send("#{att}=", val)
        end
      end
    end
    medium_attr_accessor *medium_attributes
  end
  module InstanceMethods
    def medium_with_build
      medium_without_build || build_medium
    end
  end
end