import 'dart:async';
import 'dart:convert';

import 'package:oauth2/oauth2.dart' as oauth;
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'src/client.dart';
import 'src/twitter_stream.dart';

export 'src/twitter_stream.dart';

final authorizationEndpoint =
    Uri.parse("http://example.com/oauth2/authorization");
final tokenEndpoint =
    Uri.parse("https://api.twitter.com/oauth2/token");

/// A Class for Twitter
class Twitter {
  /// Twitter API Endpoint
  final String baseUrl = 'https://api.twitter.com/1.1/';
  final String CONSUMER_KEY = "YPMSDziqHsPPgFr5TAilswgqS";
  final String CONSUMER_SECRET = "eeA09Wn22HJ9wFXeIs50IVUREltRaG2Gd956hd7KJjXd4DZnxs";
  
  Twitter(){

    var str = CONSUMER_KEY + ":" + CONSUMER_SECRET;
    var bytes = UTF8.encode(str);
    var secret = BASE64.encode(bytes);

    // test

    http.post(tokenEndpoint, headers: {
      'Authorization' : 'Basic ' + secret,
      'Content-Type' : 'application/x-www-form-urlencoded;charset=UTF-8'
    }, body: 'grant-type=client-credentials').then((response){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }
}
