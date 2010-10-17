class Book < ActiveRecord::Base

  acts_as_taggable
  ajaxful_rateable :stars => 10

  belongs_to :author

  has_attached_file :file

end

