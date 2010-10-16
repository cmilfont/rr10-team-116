class Book < ActiveRecord::Base

  belongs_to :author

  has_attached_file :file

end

