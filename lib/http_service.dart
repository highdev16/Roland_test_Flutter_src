import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<String> sendRequest(String postsURL, String value) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('http://192.168.1.119:5000/request'));
    request.body = json.encode({
      "value": "test"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonObject = jsonDecode(responseString);
      if (jsonObject["success"] == true) return "Success";
      return "Failed";
    }
    else {
      return "Failed";
    }
  }
}
