  # Autor: Paolo Neil Valladares Bazalar
  # Repositorio: https://github.com/pvbn11/ProjectKaratePetStore
  # Descripción: Suite de automatización para la API de PetStore
    
@PetFeature
Feature: Everything about your pets

  Background:
    Given url baseUrl
    * def bodyUpdatePetStore = read('classpath:body/BodyUpdatePetStore.json')
    * def bodyAddPetStore = read('classpath:body/BodyAddPetStore.json')
    * def headerApiPet = read('classpath:headers/headerPet.json')
    * def bodyAddPetStoreInvalidDataType = read('classpath:body/BodyAddPetStoreInvalidDataType.json')
    * def bodyUpdateInvalidFormat = read('classpath:body/BodyUpdateInvalidFormat.json')
    * def bodyUpdatePetStoreIdNotFound = read('classpath:body/BodyUpdatePetStoreIdNotFound.json')
    * def bodyUpdatePetStoreValidationException = read('classpath:body/BodyUpdatePetStoreValidationException.json')

  @PetCreate
  Scenario: [SE][PRI][HU-Automate Service Pet Store] Add new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyAddPetStore
    When method POST
    Then status 200
    * print response
    * match response.name == bodyAddPetStore.name
    * print response.name
    * print bodyAddPetStore.name

  @PetCreateInvalidInput
  Scenario: [SE][ERR][HU-Automate Service Pet Store] Validate Invalid Input Add new pet to the store
    Given path '/pet/123456789'
    And headers headerApiPet
    And request bodyAddPetStore
    When method POST
    Then status 405
    * print response
    * match response.message == 'Invalid input'

  @PetCreateInvalidDataType
  Scenario: [SE][ERR][HU-Automate Service Pet Store] Validate Integer instead of String in body Add new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyAddPetStoreInvalidDataType
    When method POST
    Then status 400
    * print response

  @PetSearchById
  Scenario Outline: [SE][PRI][HU-Automate Service Pet Store] Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 200
    * print response
    * match response.id == <petId>
    Examples:
      |petId|
      | 2   |

  @PetSearchByIdParameterEmpty
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate Parameter empty Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * match response.message == 'Invalid ID supplied'
    Examples:
      |petId|
      |    |

  @PetSearchByIdParameterNull
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate Parameter null Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * match response.message == 'Invalid ID supplied'
    Examples:
      |petId  |
      | null  |

  @PetSearchByIdParameterNullSpecialCharacter
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate Parameter special character Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * match response.message == 'Invalid ID supplied'
    Examples:
      |petId       |
      | $$$$@@***  |

  @PetSearchByIdParameterIdNotFound
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate Parameter Id Not Found Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 404
    * print response
    * match response.message == 'Pet not found'
    Examples:
      |petId       |
      | 1999999   |

  @PetSearchByIdParameterStringValue
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate Parameter String value  Search Pet By Id
    Given path '/pet','<petId>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * match response.message == 'Invalid ID supplied'
    Examples:
      |petId       |
      | PaoloNeil  |

  @PetUpdate
  Scenario: [SE][PRI][HU-Automate Service Pet Store] Update new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyUpdatePetStore
    When method PUT
    Then status 200
    * print response
    * match response.name == bodyUpdatePetStore.name
    * print response.name
    * print bodyUpdatePetStore.name

  @PetUpdatBodyInvalidFormat
  Scenario: [SE][ERR][HU-Automate Service Pet Store] Validate Invalid Format Request Update new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyUpdateInvalidFormat
    When method PUT
    Then status 400
    * print response
    * match response.message == 'Invalid ID supplied'

  @PetUpdateBodyIdNotFound
  Scenario: [SE][ERR][HU-Automate Service Pet Store] Validate Pet not found Update new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyUpdatePetStoreIdNotFound
    When method PUT
    Then status 404
    * print response
    * match response.message == 'Pet not found'

  @PetUpdateValidationException
  Scenario: [SE][ERR][HU-Automate Service Pet Store] Validate Validation exception Update new pet to the store
    Given path '/pet'
    And headers headerApiPet
    And request bodyUpdatePetStoreValidationException
    When method PUT
    Then status 405
    * match response.message == 'Validation exception'

  @PetSearchByStatus
  Scenario Outline: [SE][PRI][HU-Automate Service Pet Store] Search Pet By Status
    Given path '/pet/findByStatus'
    And param status = '<status>'
    And headers headerApiPet
    When method GET
    Then status 200
    * print response
    * print status
    * print response[1].status
    * match response[1].status == status
    Examples:
      |status|
      |sold |

  @PetSearchByStatusHeaderEmpty
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate header empty Search Pet By Status
    Given path '/pet/findByStatus'
    And param status = '<status>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * print status
    Examples:
      |status|
      |      |

  @PetSearchByStatusHeaderNull
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate header null Search Pet By Status
    Given path '/pet/findByStatus'
    And param status = '<status>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * print status
    Examples:
      |status|
      | null |

  @PetSearchByStatusHeaderSpecialCharacter
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate header special character Search Pet By Status
    Given path '/pet/findByStatus'
    And param status = '<status>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * print status
    Examples:
      |status  |
      | $$$$@@ |

  @PetSearchByStatusHeaderDiferentValue
  Scenario Outline: [SE][ERR][HU-Automate Service Pet Store] Validate header diferent value Search Pet By Status
    Given path '/pet/findByStatus'
    And param status = '<status>'
    And headers headerApiPet
    When method GET
    Then status 400
    * print response
    * print status
    Examples:
      |status    |
      |soldout   |