class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable+
  has_attached_file :avatar
  has_one :cart
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

  # Setup accessible (or protected) attributes for your model
  	attr_accessible :email, :password, :password_confirmation, :remember_me,:name,:points,:avatar,:phone,:address
  # attr_accessible :title, :body
    #devise :database_authenticatable, :rememberable, :trackable, :authentication_keys => [:email]
    #validates :phone , :numericality => {:message => "debe ser un número"}
    validates :phone, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 99999999, :message => "debe ser de 8 dígitos"}

    validates :name,:address,:phone, :presence => {:message => "debe estar presente"} 
    validates :email, :format => {:with => %r{\A[\w\.]+@\w+\.[A-Za-z]+\z}, :message => 'ingresado no es un formato válido'}



    HUMANIZED_ATTRIBUTES = {
    :name => "El nombre",
    :email => "El correo",
    :phone => "El teléfono",
    :address => "La direccion",
    :password => "La contraseña",
    :points => "Los puntos",
    :password_confirmation => "La contraseña de confirmación",
    :avatar => "El avatar",
    :current_password => "Contraseña actual",
    :remember_me => "No cerrar sesión"
  }

    def self.human_attribute_name(attr, options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end
    
	
end
