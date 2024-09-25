  #  Activity
    #Send request to /api/accounts/add-primary-account
    # Status should be 201 and response contain email entity
  Feature: Create Account Feature
    @NewAccount_1
    Scenario: Create new account
      Given url BASE_URL
      Given path "/api/accounts/add-primary-account"
      * def email = "nasiba.98765@tekschool.us"
      Given request
        """
        {
          "email": "nasiba.98765@tekschool.us",
          "firstName": "Nasiba",
          "lastName": "Mehr",
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
      Then assert response.email == email
      * def createdAccountId = response.id
      * def tokenGenerationResult = callonce read('GenerateSupervisorToken.feature')
      * def validToken = "Bearer " + tokenGenerationResult.response.token
      Given path "/api/accounts/delete-account"
      Given param primaryPersonId = createdAccountId
      Given header Authorization = validToken
      When method delete
      Then status 202