module Refinery
  module Categories
    class Category < Refinery::Core::BaseModel
      #has_many :menu_headers
      acts_as_tree :order => "name"
      
      has_many :subcategories, :class_name => '::Refinery::Subcategories::Subcategory' ,:dependent =>:restrict
      accepts_nested_attributes_for :subcategories 
      
      self.table_name = 'refinery_categories'

      attr_accessible :name, :position,:parent_id

      validates :name, :presence => { :message => "debe estar presente" }
      validates :name,:uniqueness => { :message => "ya esta en uso" }
      
      HUMANIZED_ATTRIBUTES = {:name => "El nombre"}

      def self.human_attribute_name(attr, options={})
        HUMANIZED_ATTRIBUTES[attr.to_sym] || super
      end
    end
  end
end
