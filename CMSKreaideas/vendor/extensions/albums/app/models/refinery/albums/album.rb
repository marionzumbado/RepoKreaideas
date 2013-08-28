module Refinery
  module Albums
    class Album < Refinery::Core::BaseModel
      self.table_name = 'refinery_albums'

      attr_accessible :name, :description, :imagen_id, :position

      validates :name, :presence =>  { :message => "debe estar presente" }

      belongs_to :imagen, :class_name => '::Refinery::Image'



      HUMANIZED_ATTRIBUTES = {
	    :name => "El nombre",
	    :description => "La descripción",
	    :imagen => "La imagen",
      }

	  def self.human_attribute_name(attr, options={})
	    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	  end

    end
  end
end
