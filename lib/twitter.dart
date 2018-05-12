import 'dart:async';

import 'package:http/http.dart' as http;


export 'src/twitter_stream.dart';

final tokenEndpoint =
    Uri.parse("https://api.twitter.com/oauth2/token");

/// A Class for Twitter
class Twitter {
  final String _bearer;
  Completer<http.Response> _completer = new Completer<http.Response>.sync();
  /// Twitter API Endpoint
  final String baseUrl = 'https://api.twitter.com/1.1/';

  
  Twitter(this._bearer){
    /*
    var str = CONSUMER_KEY + ":" + CONSUMER_SECRET;
    var bytes = UTF8.encode(str);
    var secret = BASE64.encode(bytes);



    http.post(tokenEndpoint, body: "grant_type=client_credentials", headers: {
      'Authorization' : 'Basic ' + secret,
      'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
    }).then((response){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      
    });
    
    http.get(baseUrl + "statuses/user_timeline.json?screen_name=twitterapi",headers: {
      'Authorization' : bearer
    }).then((response){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

    });*/
  }

  Future<http.Response> request(String endPoint) {
    if(_completer.isCompleted) {
      _completer = new Completer<http.Response>.sync();
    }
    var requestUrl = baseUrl + endPoint;
    _request(requestUrl);
    return _completer.future;
  }

  _request(String requestUrl) async{
    http.get(requestUrl,headers: {
      'Authorization' : _bearer
    }).then((response){
      print("Response status: ${response.statusCode}");
      _completer.complete(response);
    });
  }
}
