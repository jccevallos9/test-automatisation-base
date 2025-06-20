@REQ_MARVEL-008 @marvel-delete
Feature: Eliminar personaje

  Background:
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  @id:1 @DeleteSuccess
  Scenario: Eliminar personaje Juanceva exitosamente
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/855'
    Given url setUrlTest
    When method DELETE
    Then status 204

  @id:2 @DeleteNotFound
  Scenario: Error al intentar eliminar personaje inexistente
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/999'
    Given url setUrlTest
    When method DELETE
    Then status 404
    And match response == { error: "Character not found" }
