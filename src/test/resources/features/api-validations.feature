Feature: Validation of API Endpoints

  Scenario Outline: HEAD to check if the Server is Up
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | HEAD        | NA           | 200                  |

  Scenario Outline: GET All Products List
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives all products list from server in response body
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | GET         | /productsList| 200                  |

  Scenario Outline: GET All Brands List
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives all brands list from server in response body
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | GET         | /brandsList  | 200                  |

  Scenario Outline: POST to create/register user account
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives success message for "<http_method>" request
    Examples:
      | http_method | api_endpoint   | expected_status_code |
      | POST        | /createAccount | 201                  |

  Scenario Outline: POST to verify Login with valid details
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives success message for "<http_method>" request
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | POST        | /verifyLogin | 200                  |

  Scenario Outline: PUT to update user account
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives success message for "<http_method>" request
    Examples:
      | http_method | api_endpoint   | expected_status_code |
      | PUT         | /updateAccount | 200                  |

  Scenario Outline: DELETE to delete user account
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives success message for "<http_method>" request
    Examples:
      | http_method | api_endpoint   | expected_status_code |
      | DELETE      | /deleteAccount | 200                  |

  Scenario Outline: Negative Testing - PUT to All Brands List
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives error response message
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | PUT         | /brandsList  | 405                  |

  Scenario Outline: Negative Testing - POST to All Products List
    Given API Base URI is set to base_uri
    When User sends "<http_method>" request to "<api_endpoint>"
    Then Response status code should be "<expected_status_code>"
    And User receives error response message
    Examples:
      | http_method | api_endpoint | expected_status_code |
      | POST        | /productsList| 405                  |

