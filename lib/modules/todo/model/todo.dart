import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey()
  int userId;
  @JsonKey()
  int id;
  @JsonKey()
  String title;
  @JsonKey()
  bool completed;

  Todo({
    this.userId = 0,
    this.id = 0,
    this.title = "",
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
