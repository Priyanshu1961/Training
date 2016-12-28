class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :pincode, :numericality => {:only_integer => true},  :length=> {:minimum=> 6, :maximum=> 6, :message => "Number must be 6 digit long"}, allow_blank: true
  #validates :pincode, :numericality => {:only_integer => true},is: 6, presence: true,message: "Number must be 6 digit long", if: "pincode.present?"
  #validates_length_of :pincode, is: 6,  message: "Number must be 6 digit long",presence: true, if: "pincode.present?"
end
