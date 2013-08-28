module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      has_many :line_items,:class_name => '::LineItem'
      before_destroy :ensure_not_referenced_by_any_line_item
      has_attached_file :attach
      attr_accessor :delete_attach
      before_validation { attach.clear if delete_attach == '1' }
      has_many :productimages ,:class_name => '::Productimage', :dependent => :destroy
      accepts_nested_attributes_for :productimages, :allow_destroy => true
      #accepts_nested_attributes_for :attach, :allow_destroy => true
      belongs_to :category , :class_name => '::Refinery::Categories::Category'
      belongs_to :subcategory, :class_name => '::Refinery::Subcategories::Subcategory'
      belongs_to :image, :class_name => '::Refinery::Image'
      self.table_name = 'refinery_products'
      attr_accessible :stock,:delete_attach,:name, :description, :price, :code, :author, :exchange, :bonus, :subcategory_id, :position,:attach,:productimages_attributes
      validates :subcategory_id,:name,:description, :price, :code, :author, :exchange, :bonus, :presence => { :message => "debe estar presente" }
      validates :code, :uniqueness => { :message => "ya esta en uso" }
      validates :price,:bonus,:stock,:exchange ,:numericality => { :message => "debe ser un número" }



      HUMANIZED_ATTRIBUTES = {
        :code => "El código",
        :name => "El nombre",
        :price => "El precio",
        :author => "El autor",
        :bonus => "El bono",
        :exchange => "El canje",
        :description => "La descripción",
        :subcategory_id => "La subcategoria",
        :stock => "El stock"
      }

      def self.human_attribute_name(attr, options={})
        HUMANIZED_ATTRIBUTES[attr.to_sym] || super
      end





      
      
      # ensure that there are no line items referencing this product
      def ensure_not_referenced_by_any_line_item
        if line_items.count.zero?
          return true
        else
          errors.add(:base, 'Line Items present' )
          return false
        end
      end



    end
  end
end
