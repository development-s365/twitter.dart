import 'dart:io';
import 'package:twitter/twitter.dart';

main() {
  var envVars = Platform.environment;
  print(envVars['CONSUMER_KEY']);
  print(envVars['CONSUMER_SECRET']);
  print(envVars['ACCESS_TOKEN']);
  print(envVars['ACCESS_TOKEN_SECRET']);
  var map = {
      "consumerKey": envVars['CONSUMER_KEY'],
      "consumerSecret": envVars['CONSUMER_SECRET'],
      "accessToken": envVars['ACCESS_TOKEN'],
      "accessSecret": envVars['ACCESS_TOKEN_SECRET']
  };
  Twitter twitter = new Twitter();
  
  /*try {
    var a = twitter.request("POST", "statuses/update.json",body: {"status":"test"});
    a.then((value){
      new File("test.json").writeAsString(value.body);
    });
  } catch(e) {
  } finally {
  }*/
  return;
}