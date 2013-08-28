module Refinery
  module Bulletins
    class Bulletin < Refinery::Core::BaseModel
      self.table_name = 'refinery_bulletins'

      attr_accessible :title, :description, :publicationday, :user_id, :position

      validates :title, :presence =>  { :message => "debe estar presente" }


      HUMANIZED_ATTRIBUTES = {
	    :title => "El titulo",
	    :description => "La descripción",
	    :publicationday => "El dia de publicación",
	    :user_id => "El usuario que realizo la publicación"
    
  		}

	  def self.human_attribute_name(attr, options={})
	    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	  end


    end
  end
end
