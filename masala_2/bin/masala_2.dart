import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) {

  // ! API ni Uri type ga o'zgartiradi
  Uri uri = Uri.parse("https://www.boredapi.com/api/activity");

  // ! API dan kelgan ma'lumtni qaytaradi
  http.get(uri).then((data) {
    Map response = jsonDecode(data.body);

    Activity activity = Activity(
        title: response["activity"], type: "type", participant: "participants");

    print(activity.toString());
  });
}

class Activity {
  String title;
  String type;
  String participant;

  Activity(
      {required this.title, required this.type, required this.participant});

  // ! Ma'lumotlarni formatlab qayataradi
  @override
  String toString() {
    return """
Title: $title
Type: $type
Participiant: $participant
""";
  }
}
