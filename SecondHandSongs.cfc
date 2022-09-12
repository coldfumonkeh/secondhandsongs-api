component accessors="true" {

    property name="apiKey" type="string" default="";
    property name="baseURL" type="string" default="https://secondhandsongs.com/search/";

    public SecondHandSongs function init(
        string apiKey = '',
        string baseURL = 'https://secondhandsongs.com/search/'
    ){
        setApiKey( arguments.apiKey );
        setBaseURL( arguments.baseURL );
        return this;
    }

    /**
     * Makes a call to search for an artist
     *
     * @commonName The common name of the artist
     */
    public function searchArtist(
        required string commonName,
        number pageSize,
        number page
    ){
        return makeCall(
            endpoint = 'artist',
            parameters = arguments
        );
    }

    /**
     * Makes a call to search for a performance
     *
     * @title The title of the performance
     * @performer The performer (optional)
     * @date The date (optional)
     */
    public function searchPerformance(
        required string title,
        string performer,
        string date,
        number pageSize,
        number page
    ){
        return makeCall(
            endpoint = 'performance',
            parameters = arguments
        );
    }

    /**
     * Makes a call to search for a piece of work
     *
     * @title The title of the work
     * @credits The credits (optional)
     */
    public function searchWork(
        required string title,
        string credits,
        number pageSize,
        number page
    ){
        return makeCall(
            endpoint = 'work',
            parameters = arguments
        );
    }

    /**
     * Makes a call to search for an object
     *
     * @caption artist commonName, performance title or work title
     */
    public function searchObject(
        required string caption,
        number pageSize,
        number page
    ){
        return makeCall(
            endpoint = 'object',
            parameters = arguments
        );
    }


    /**
     * I make a call to the API endpoint using the provided parameters
     *
     * @endpoint The endpoint to call
     * @parameters A struct of parameters to send in the API request to make up the URL parameters
     */
    private struct function makeCall(
        required string endpoint,
        required struct parameters
    ){
        var stuResponse = {};
        var httpService = new http();
        httpService.setMethod( "GET" );
        httpService.setCharset( "utf-8" );
        httpService.setUrl( getBaseURL() & arguments.endpoint );
        if( len( getApiKey() ) ){
            httpService.addParam( type="header", name="X-API-Key",  value=getApiKey() );
        }
        httpService.addParam( type="header", name="Accept",  value="application/json" );
        if( structCount( arguments.parameters ) ){
            for( var item in arguments.parameters ){
                httpService.addParam( type="URL", name=item,  value=arguments.parameters[ item ] );
            }
        }
        var result = httpService.send().getPrefix();
        if( structKeyExists( result, 'status_code' ) && '200' == result[ 'status_code' ] ) {
	    	stuResponse.success = true;
	    	stuResponse.content = result.FileContent;
	    } else {
	    	stuResponse.success = false;
	    	stuResponse.content = result.Statuscode;
	    }
        return stuResponse;
    }

}