Feature:Send request

  Scenario: /api/accounts/add-primary-account

Given url BASE_URL
    Given path "/api/accounts/add-primary-account/"
    * def email = "nasiba.222@tekschool.us"
    Given request
      """
      {
        "email": "asiba.222@tekschool.us",
        "firstName": "Nasib",
        "lastName": "Mehra",
        "title": "Ms.",
        "gender": "FEMALE",
        "maritalStatus": "Single",
        "employmentStatus": "student",
        "dateOfBirth": "1995-11-06"
      }
      """
    When method post
    Then print response
    Then status 201
