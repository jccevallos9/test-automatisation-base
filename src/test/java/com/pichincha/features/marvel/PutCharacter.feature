@REQ_MARVEL-005 @marvel-put-update
Feature: Actualizar personaje - Caso exitoso

  Background:
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/855'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  Scenario: Actualizar personaje Juanceva exitosamente
    * def body = read('classpath:data/marvel/PutCharacterUpdate.json')
    Given url setUrlTest
    And request body
    When method PUT
    Then status 200
    And match response ==
      """
      {
        id: 855,
        name: "Juanceva Updated",
        alterego: "JC Cevallos",
        description: "Now with stealth mode",
        powers: ["Armor", "Stealth"]
      }
      """

  Scenario: Error al actualizar personaje con ID inexistente
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    * def body = read('classpath:data/marvel/PutCharacterInvalid.json')
    Given url setUrlTest
    And request body
    When method PUT
    Then status 404
    And match response ==
      """
      {
        error: "Character not found"
      }
      """