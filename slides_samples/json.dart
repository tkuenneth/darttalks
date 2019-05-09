import "dart:convert";

main() {
  var map = {
    "question": "meaning of life",
    "answer": 42
  };

  var jsonString = jsonEncode(map);
  print(map);

  Map<String, dynamic> map2 = jsonDecode(jsonString);
  print('Question: ${map2['question']}');
  print('Answer: ${map2['answer']}');
}
