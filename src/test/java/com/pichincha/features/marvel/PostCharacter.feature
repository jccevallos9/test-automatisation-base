@REQ_MARVEL-004 @marvel-post-create
Feature: Crear personaje nuevo con datos personalizados

  Background:
    * def setUrlTest = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  @id:1 @PostSuccess
  Scenario: Crear personaje con identidad personalizada de Juanceva
    * def body = read('classpath:data/marvel/PostCharacterRequest.json')
    * print body
    Given url setUrlTest
    And request body
    When method POST
    Then status 201
    And match response ==
      """
      {
        id: '#number',
        name: "Juanceva",
        alterego: "Juan Carlos Cevallos",
        description: "A superhero with new abilitios of fast flight and enhanced armor.",
        powers: ["Armor", "Flight"]
      }
      """

  @id:2 @PostDuplicate
  Scenario: Error al crear personaje con nombre duplicado
    * def body = read('classpath:data/marvel/PostDuplicateCharacter.json')
    Given url setUrlTest
    And request body
    When method POST
    Then status 409
    And match response == { error: 'Character name already exists' }

  @id:3 @PostMissingFields
  Scenario: Error al crear personaje con campos requeridos vacíos
    * def body = read('classpath:data/marvel/PostEmptyFields.json')
    Given url setUrlTest
    And request body
    When method POST
    Then status 400
    And match response ==
      """
      {
        "name": "Name is required",
        "description": "Description is required",
        "powers": "Powers are required",
        "alterego": "Alterego is required"
      }
      """
