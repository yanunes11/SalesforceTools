public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<Object> animals = new List<Object>();
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            System.debug('animals[Id]: '+animals[Id]);
        }
        return String.valueOf(animals[Id]);
    }
}
