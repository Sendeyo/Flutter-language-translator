import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBodyController extends GetxController {
  var ipAddress = "35.193.165.125".obs;
  var translatedText = "Translated text appear here".obs;

  Future translate(statement, src, dest) async {
    final response = await http.get(
        Uri.parse(
            "http://${ipAddress}:8000/translation?sentence=$statement&source=$src&destination=$dest"),
        headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        });
    return response.body.replaceAll('\\n', '\n');
  }
}

class HomeControler extends GetxController {
  var appName = "Translator app";
  RxString ipAddress = "fake".obs;

  void setIpAddress(text) {
    this.ipAddress = text;
    print("SUCCESS : ${text}");
  }
}
