Feature: Admins should be able to create posts
  As an admin
  I want to create a post
  So I can share my uber-important thoughts with the webs

  Scenario: An admin successfully creates a post
    Given I am on the create new post page
    When I fill in "Title" with "My first post"
    And I fill in "Body" with "Ramble ramble"
    And I press "Create Post"
    Then I should have a valid post with title "My first post"
    And I should see "Post created successfully!"

  Scenario: An admin creates an invalid post
    Given I am on the create new post page
    And I fill in "Body" with "Ramble ramble"
    And I press "Create Post"
    Then I should see "Title can't be blank"

