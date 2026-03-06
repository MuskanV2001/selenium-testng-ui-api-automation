package stepDefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import utils.FileUtils;

import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.given;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;

public class APITestsStepDef {

    Response api_response;

    @Given("API Base URI is set to base_uri")
    public void setBaseURI(){
        RestAssured.baseURI = "https://automationexercise.com/api";
    }

    @When("User sends {string} request to {string}")
    public void sendHttpMethodRequest(String http_method, String api_endpoint){

        if(http_method.equals("HEAD")) {
            api_response = given()
                    .baseUri(baseURI)
                    .when()
                    .head();
        }
        if(http_method.equals("GET")){
            api_response = given()
                    .baseUri(baseURI)
                    .when()
                    .get(api_endpoint);
        }
        if(http_method.equals("POST")){
            JSONObject post_request_payload = FileUtils.jsonReader();
            api_response = given()
                    .baseUri(baseURI)
                    .body(post_request_payload)
                    .when()
                    .post(api_endpoint);
        }
        if(http_method.equals("PUT")){
            JSONObject put_request_payload = FileUtils.jsonReader();
            api_response = given()
                    .baseUri(baseURI)
                    .body(put_request_payload)
                    .when()
                    .put(api_endpoint);
        }
        if(http_method.equals("DELETE")){
            api_response = given()
                    .baseUri(baseURI)
                    .when()
                    .delete(api_endpoint);
        }
    }

    @Then("Response status code should be {int}")
    public void checkStatusCode(int expected_status_code){
        assertThat(api_response.statusCode(), equalTo(expected_status_code));
        System.out.println("Status Code validated");
    }

    @And("User receives all products list from server in response body")
    public void verifyProductsList(){

    }

    @And("User receives all brands list from server in response body")
    public void verifyBrandsList(){

    }

    @And("User receives success message for {string} request")
    public void verifySuccessMessage(String http_method){
        String success_message = api_response.body().jsonPath().getString("message");
        if(http_method.equals("POST")){
            assertThat(success_message, equalTo("User created!"));
        }
        if(http_method.equals("PUT")){
            assertThat(success_message, equalTo("User updated!"));
        }
        if(http_method.equals("DELETE")){
            assertThat(success_message, equalTo("Account deleted!"));
        }
    }

    @And("User receives error response message")
    public void verifyErrorResponse(){
        assertThat(api_response.body().jsonPath().getString("message"),
                containsString("This request method is not supported."));
        System.out.println("405 error message received in response");
    }
}
