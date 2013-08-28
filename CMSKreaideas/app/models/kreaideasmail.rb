class Kreaideasmail < ActiveRecord::Base
  attr_accessible :email, :message, :name


	validates :name,:email,:message, :presence => {:message => "debe estar presente"} 
	validates :email, :format => {:with => %r{\A[\w\.]+@\w+\.[A-Za-z]+\z}, :message => 'ingresado no es un formato válido'}
  validates :phone, :numericality => {:message => "debe ser número"}


	HUMANIZED_ATTRIBUTES = {
    :name => "El nombre",
    :email => "El correo",
    :message => "El mensaje"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end

end
