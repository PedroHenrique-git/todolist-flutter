import 'package:uuid/uuid.dart';

enum Finish { yes, no }

class Task {
  String id = const Uuid().v4();
  String description = '';
  Finish finish = Finish.yes;

  Task(this.description, this.finish);

  factory Task.fromJson(Map<String, dynamic> parsedJson) {
    return Task(parsedJson['description'],
        parsedJson['finish'] == 'yes' ? Finish.yes : Finish.no);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'finish': finish == Finish.yes ? 'yes' : 'no'
    };
  }
}
