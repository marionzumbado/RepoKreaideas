class Productimage < ActiveRecord::Base
   belongs_to :product, :class_name => '::Refinery::Products::Product'
   has_attached_file :image, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }
   attr_accessible :image,:name,:image_file_name 
end
