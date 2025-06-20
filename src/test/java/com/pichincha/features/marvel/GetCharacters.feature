@REQ_MARVEL-001 @marvel-get-all
Feature: Obtener lista de personajes

  Background:
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    * header Accept = 'application/json'

  @di:1
  Scenario: Obtener lista de personajes y validar contenido relevante
    Given url setUrlTest
    When method GET
    Then status 200
    And match response contains { id: 4, name: "Character with many powers" }
    And match response contains { name: "Spider-Man" }
    And match response contains { name: "Iron Man" }
    And match each response[*].powers == '#[]'
    And match each response[*].id == '#number'
    And match each response[*].name == '#string'
