require 'action_controller/test_process'

Factory.class_eval do
  def attach(name, path, content_type = nil)
    if content_type
      add_attribute name, ActionController::TestUploadedFile.new("#{RAILS_ROOT}/#{path}", content_type)
    else
      add_attribute name, ActionController::TestUploadedFile.new("#{RAILS_ROOT}/#{path}")
    end
  end
end

Factory.sequence :book do |n|
  "name#{n}"
end

Factory.define :book do |a|
  a.title "Smalltalk Best Practice Patterns"
  a.association :author
  a.year "1996"
  a.edition "1"
  a.publisher "Prentice Hall"
  a.attach       ( "file", "features/support/book/Bertrand_Russel-Theory-of-Knowledge.pdf", "application/pdf" )
end

