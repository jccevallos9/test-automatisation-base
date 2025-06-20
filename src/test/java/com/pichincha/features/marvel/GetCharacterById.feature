@REQ_MARVEL-003 @marvel-get-id-30
Feature: Obtener personaje por ID - Validar personaje con ID 30

  Background:
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/30'
    * header Accept = 'application/json'

  @id:1 @SuccessId
  Scenario: Validar datos completos del personaje con ID 30
    Given url setUrlTest
    When method GET
    Then status 200
    And match response ==
      """
      {
        id: 30,
        name: "Valid Character-1750394648357",
        alterego: "Valid Alter",
        description: "Valid description",
        powers: [
          "Power1",
          "Power2"
        ]
      }
      """

    @id:2 @NotFound
    Scenario: Validar error al buscar personaje con ID inexistente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/9999'
    When method GET
    Then status 404
    And match response ==
      """
      {
        error: "Character not found"
      }
      """
    And match response.error == 'Character not found'
    And match response == { error: '#string' }

  @id:3 @InvalidInput
  Scenario: Validar comportamiento con input malicioso (inyección SQL simulada)
    Given url "https://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/'; DROP TABLE characters; --"
    When method GET
    Then status 400

  @id:4 @EmptyInput
  Scenario: Validar comportamiento cuando el ID está vacío
    Given url 'https://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/'
    When method GET
    Then status 404

  @id:5 @SpecialCharId
  Scenario: Validar comportamiento con ID no numérico
    Given url 'https://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/!@#$%'
    When method GET
    Then status 400


