Feature: Validation of API Endpoints

  Scenario Outline: HEAD to check if the Server is Up
    Given API Base URI is set to base_uri
    When User sends HEAD request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: GET All Products List
    Given API Base URI is set to base_uri
    When User sends GET request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: GET All Brands List
    Given API Base URI is set to base_uri
    When User sends GET request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: POST to create/register user account
    Given API Base URI is set to base_uri
    When User sends POST request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: POST to verify Login with valid details
    Given API Base URI is set to base_uri
    When User sends POST request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: PUT to update user account
    Given API Base URI is set to base_uri
    When User sends PUT request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: DELETE to delete user account
    Given API Base URI is set to base_uri
    When User sends DELETE request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: Negative Testing - PUT to All Brands List
    Given API Base URI is set to base_uri
    When User sends PUT request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

  Scenario Outline: Negative Testing - POST to All Products List
    Given API Base URI is set to base_uri
    When User sends POST request to "<api_endpoint>"
    Then Response status code should be "<status_code>"
    Examples:
      | api_endpoint | status_code |

