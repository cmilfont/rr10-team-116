# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'factory_girl'
Dir.glob(File.join(File.dirname(__FILE__), '../spec/factories/*.rb')).each {|f| require f }

@author = Factory(:author, :name => "Kent Beck")
puts "Author #{@author.name} saved!"
@author2 = Factory(:author, :name => "Martin Fowler")
puts "Author #{@author2.name} saved!"

@book = Factory(:book,  :title => "Smalltalk Best Practice Patterns", 
                        :author => @author, 
                        :year => "1996", 
                        :edition => "1", 
                        :publisher => "Prentice Hall")
puts "Book #{@book.title} saved!"                        
                        
@book = Factory(:book,  :title => "Kent Beck's Guide to Better Smalltalk : A Sorted Collection", 
                        :author => @author, 
                        :year => "1996", 
                        :edition => "1", 
                        :publisher => "Cambridge University Press")
puts "Book #{@book.title} saved!"                      
                        
@book = Factory(:book,  :title => "Extreme Programming Explained: Embrace Change", 
                        :author => @author, 
                        :year => "1999", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Planning Extreme Programming", 
                        :author => @author, 
                        :year => "2000", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Test-Driven Development: By Example.", 
                        :author => @author, 
                        :year => "2002", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"
                        
@book = Factory(:book,  :title => "Contributing to Eclipse: Principles, Patterns, and Plugins", 
                        :author => @author, 
                        :year => "2003", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "JUnit Pocket Guide", 
                        :author => @author, 
                        :year => "2004", 
                        :edition => "1", 
                        :publisher => "O'Reilly")       
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Extreme Programming Explained: Embrace Change", 
                        :author => @author, 
                        :year => "2005", 
                        :edition => "2", 
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Implementation Patterns", 
                        :author => @author, 
                        :year => "2008", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Analysis Patterns: Reusable Object Models", 
                        :author => @author2, 
                        :year => "2008", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"        

@book = Factory(:book,  :title => "Refactoring: Improving the Design of Existing Code", 
                        :author => @author2, 
                        :year => "1999", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Domain-Specific Languages", 
                        :author => @author2, 
                        :year => "2010", 
                        :edition => "1", 
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"



                 