component extends="testbox.system.BaseSpec"{

	function beforeAll(){
		variables.objSHS = createMock( 'SecondHandSongs' ).init();
	}

	function afterAll(){}

	function run(){

		describe( "The SecondHandSongs Component", function(){

			describe( "Instance of the SecondHandSongs Component", function(){

				it( 'should be the correct return type', function(){
					expect( variables.objSHS )
						.toBeTypeOf( 'component' )
						.toBeInstanceOf( 'secondhandsongs' );
				} );

				it( 'should have the following methods', function(){

					makePublic( variables.objSHS, 'makeCall', 'makeCall' );

					expect( variables.objSHS )
						.toHaveKey( 'makeCall' )
						.toHaveKey( 'getApiKey' )
						.toHaveKey( 'setApiKey' )
						.toHaveKey( 'getBaseURL' )
						.toHaveKey( 'setBaseURL' )
						.toHaveKey( 'searchArtist' )
						.toHaveKey( 'searchPerformance' )
						.toHaveKey( 'searchWork' )
						.toHaveKey( 'searchObject' );

				} );

			} );

		});

		describe( "Calling Methods", function(){

			describe( 'The `searchArtist()` method', function(){

				it( 'should return a struct of information', function(){

					var resp = variables.objSHS.searchArtist( commonName = 'beatles' );

					expect( resp )
						.toBeStruct()
						.toHaveKey( 'success' )
						.toHaveKey( 'content' );

				} );

				it( 'should call the `makeCall` method', function(){

					var mockService = createMock( 'SecondHandSongs' );
					mockService.$( method = 'makeCall', returns = { "success": true, "content": {} } );
					var resp = mockService.searchArtist( commonName = 'beatles' );
					expect( mockService.$count( 'makeCall' ) ).toBe( 1 );

				} );

			} );

			describe( 'The `searchPerformance()` method', function(){

				it( 'should return a struct of information', function(){

					var resp = variables.objSHS.searchPerformance( title = 'blackbird', performer = 'beatles' );

					expect( resp )
						.toBeStruct()
						.toHaveKey( 'success' )
						.toHaveKey( 'content' );

				} );

				it( 'should call the `makeCall` method', function(){

					var mockService = createMock( 'SecondHandSongs' );
					mockService.$( method = 'makeCall', returns = { "success": true, "content": {} } );
					var resp = mockService.searchPerformance( title = 'blackbird', performer = 'beatles' );
					expect( mockService.$count( 'makeCall' ) ).toBe( 1 );

				} );

			} );

			describe( 'The `searchWork()` method', function(){

				it( 'should return a struct of information', function(){

					var resp = variables.objSHS.searchWork( title = 'blackbird' );

					expect( resp )
						.toBeStruct()
						.toHaveKey( 'success' )
						.toHaveKey( 'content' );

				} );

				it( 'should call the `makeCall` method', function(){

					var mockService = createMock( 'SecondHandSongs' );
					mockService.$( method = 'makeCall', returns = { "success": true, "content": {} } );
					var resp = mockService.searchWork( title = 'blackbird' );
					expect( mockService.$count( 'makeCall' ) ).toBe( 1 );

				} );

			} );

			describe( 'The `searchObject()` method', function(){

				it( 'should return a struct of information', function(){

					var resp = variables.objSHS.searchObject( caption = 'blackbird' );

					expect( resp )
						.toBeStruct()
						.toHaveKey( 'success' )
						.toHaveKey( 'content' );

				} );

				it( 'should call the `makeCall` method', function(){

					var mockService = createMock( 'SecondHandSongs' );
					mockService.$( method = 'makeCall', returns = { "success": true, "content": {} } );
					var resp = mockService.searchObject( caption = 'blackbird' );
					expect( mockService.$count( 'makeCall' ) ).toBe( 1 );

				} );

			} );

		} );


	}

}
