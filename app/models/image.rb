class Image < ActiveRecord::Base
  has_attached_file :pic, :styles => { :medium => '300x300>'}
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
end
