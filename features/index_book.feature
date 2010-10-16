Feature: Indexing Book
  As a reader
  I want index a book in PDF file format
  In order to organize the search from my personal library

  Scenario: Add book
    Given i am on "Add book"
      And i attach the file "features/support/book/Bertrand_Russel-Theory-of-Knowledge.pdf" to "File"
      And i fill in "Title" with "Theory of Knowledge"
      And i select "Bertrand Russel" from "Author"
      And i fill in "Year" with "1926"
      And i fill in "Publisher" with "The Encyclopaedia Britannica"
      And i fill in "Edition" with "First Edition"
    When i press "Save"
    Then i should see "Book saved successfully!"

