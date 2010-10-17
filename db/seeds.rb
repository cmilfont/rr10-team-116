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

@user = Factory(:user, :id => 1, 
                       :oauth_id => "94779404", 
                       :full_name => "Rodrigo Oliveira", 
                       :username => "rodrigodealer", 
                       :twitter_username => "rodrigodealer", 
                       :persistence_token => "481005e460ba13b78805a8240ca3ea783ecfa3aa505174abf9f...", 
                       :login_count => 1, 
                       :failed_login_count => 0, 
                       :last_request_at => "2010-10-17 14:46:00", 
                       :current_login_at => "2010-10-17 14:35:47", 
                       :last_login_at => nil, 
                       :current_login_ip => "127.0.0.1", 
                       :last_login_ip => nil, 
                       :provider => "twitter", 
                       :email => "rodrigo.dealer@gmail.com", 
                       :website => "http://latitude.me", 
                       :profile_image_url => "http://a2.twimg.com/profile_images/560347450/OgAAAN...")

@book = Factory(:book,  :title => "Smalltalk Best Practice Patterns", 
                        :author => "Kent Beck", 
                        :year => "1996", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Prentice Hall")
puts "Book #{@book.title} saved!"                        
                        
@book = Factory(:book,  :title => "Kent Beck's Guide to Better Smalltalk : A Sorted Collection", 
                        :author => "Kent Beck", 
                        :year => "1996", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Cambridge University Press")
puts "Book #{@book.title} saved!"                      
                        
@book = Factory(:book,  :title => "Extreme Programming Explained: Embrace Change", 
                        :author => "Kent Beck", 
                        :year => "1999", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Planning Extreme Programming", 
                        :author => "Kent Beck", 
                        :year => "2000", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Test-Driven Development: By Example.", 
                        :author => "Kent Beck", 
                        :year => "2002", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"
                        
@book = Factory(:book,  :title => "Contributing to Eclipse: Principles, Patterns, and Plugins", 
                        :author => "Kent Beck", 
                        :year => "2003", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "JUnit Pocket Guide", 
                        :author => "Kent Beck", 
                        :year => "2004", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "O'Reilly")       
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Extreme Programming Explained: Embrace Change", 
                        :author => "Kent Beck", 
                        :year => "2005", 
                        :edition => "2", 
                        :user => @user,
                        :publisher => "Addison-Wesley")
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Implementation Patterns", 
                        :author => "Martin Fowler", 
                        :year => "2008", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Analysis Patterns: Reusable Object Models", 
                        :author => "Martin Fowler", 
                        :year => "2008", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"        

@book = Factory(:book,  :title => "Refactoring: Improving the Design of Existing Code", 
                        :author => "Martin Fowler", 
                        :year => "1999", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"

@book = Factory(:book,  :title => "Domain-Specific Languages", 
                        :author => "Martin Fowler", 
                        :year => "2010", 
                        :edition => "1", 
                        :user => @user,
                        :publisher => "Addison-Wesley")                                          
puts "Book #{@book.title} saved!"



                 