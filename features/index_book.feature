Feature: Indexing Book
  As a reader
  I want index a book in PDF file format
  In order to organize the search from my personal library

  Background:
    Given I have the following authors:
      | name            |
      | Bertrand Russel |

  Scenario: Add book
    Given I am on "Add book"
      And I attach the file "features/support/book/Bertrand_Russel-Theory-of-Knowledge.pdf" to "File"
      And I fill in "Title" with "Theory of Knowledge"
      And I fill in "Year" with "1926"
      And I fill in "Publisher" with "The Encyclopaedia Britannica"
      And I fill in "Edition" with "First Edition"
      And I select "Bertrand Russel" from "Author"
    When I press "Save"
    Then I should see "Book saved successfully!"

