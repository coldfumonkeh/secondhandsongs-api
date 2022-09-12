# SecondHandSongs API Wrapper

A CFML component to interact with the [SecondHandSongs](https://secondhandsongs.com/) [API](https://secondhandsongs.com/page/API).

## Getting Started

Instantiate the component:

```
var oSHS = new SecondHandSongs();


// You can optionally pass in an API key if you have one
var oSHS = new SecondHandSongs( apiKey = 'your_api_key' );
```

## Making Requests

To search for artists:

```
var response = oSHS.searchArtist( commonName = 'beatles' );
```

To search for performances:

```
var response = oSHS.searchPerformance( title = 'blackbird', performer = 'beatles' );
```

To search for work:

```
var response = oSHS.searchWork( title = 'blackbird' );
```

To search for objects:

```
var response = oSHS.searchObject( caption = 'blackbird' );
```

---

## MIT License

Copyright (c) 2022 Matt Gifford

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.