module Refinery
  module Subcategories
    class Subcategory < Refinery::Core::BaseModel
      
      belongs_to :category, :class_name => '::Refinery::Categories::Category' 
      has_many :products, :class_name => '::Refinery::Products::Product' ,:dependent =>:restrict

      self.table_name = 'refinery_subcategories'

      attr_accessible :name, :category_id, :position,:parent_id

      validates :name, :presence => { :message => "debe estar presente" }
 
      validates :name,:uniqueness => { :message => "ya esta en uso" }

      HUMANIZED_ATTRIBUTES = {
    :name => "El nombre"}

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

    end
  end
end
