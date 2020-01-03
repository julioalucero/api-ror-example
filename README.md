## README

Ruby version: 2.2.3

Rails version: 4.2.6

## To install and use it

Copy the example files in config/. folder and complete it with real data:

    mv config/database.yml.example config/database.yml
    mv config/omniauth.yml.example config/omniauth.yml

Then run

    bundle install
    rails server

After that you can go to [localhost:3000/swagger](http://localhost:3000/swagger)

## Technologies and notes

### Api Base

[Api::BaseController](https://github.com/julioalucero/-api-ror-example/blob/master/app/controllers/api/base_controller.rb#L4-L6) is the module that contains the 3 principals concerns:
    - [Authentication](https://github.com/julioalucero/-api-ror-example/blob/master/app/controllers/api/concerns/authentication.rb). To handle *authentication* and *current_user* 
    - [Responses](https://github.com/julioalucero/-api-ror-example/blob/master/app/controllers/api/concerns/responses.rb). To handle *models_validation_errors_response*
    - [BusinessConcern](https://github.com/julioalucero/-api-ror-example/blob/master/app/controllers/api/concerns/business_concern.rb). To handle the business_logic access



### Business Logic
All the business logic is inside the lib/business folder.
The classes inside this module are responsable of the CRUD actions, and all the business logic.

### active_model_serializers
Permit to create serializers files in order to generate and render the json responses.

### json_expressions
Use to test the exactly match expression on the test.

### Constants
All the constants lives under **lib/enums/\*.rb** files.

### Tests
Using [match_json](https://github.com/julioalucero/-api-ror-example/blob/master/spec/support/helpers/responses.rb#L4) method in the test you can compare the returned API JSON with the fake one created on the test under *spec/json_expressions/\*.rb* files. Example of [users](https://github.com/julioalucero/-api-ror-example/blob/master/spec/json_expressions/users.rb)
    
### Swaggard

Swaggard is a Rails Engine that can be used to document a REST api.
It does this by generating a json that is compliant with Swagger and displaying it using Swagger-ui.

Example:
![Web UI 1 a](https://bytebucket.org/julioalucero/api-ror-example/raw/5f7c820b0d048736be14e25a6ff0bb67f0667ada/app/assets/images/swaggard-example-1.a.png)
![Web UI 1 b](https://bytebucket.org/julioalucero/api-ror-example/raw/5f7c820b0d048736be14e25a6ff0bb67f0667ada/app/assets/images/swaggard-example-1.b.png)
