import 'package:get_x_starter_kit/app/data/models/model_example.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'service.g.dart';

//TODO: Set Development and Production Base API
@RestApi(
  baseUrl: 'https://60b7752917d1dc0017b8a082.mockapi.io/api/vi/',
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/tasks')
  Future<List<TaskEntity>> getTasks();

  @GET('/tasks/{id}')
  Future<TaskEntity> getTask(@Path('id') String id);

  @POST('/task')
  Future<TaskEntity> createTask(@Body() TaskEntity taskEntity);

  @GET('/users')
  Future<List<UserEntity>> getUsers();

  @POST('/user')
  Future<UserEntity> createUser(@Body() UserEntity userEntity);

  @POST('/model-example')
  Future<Welcome> createWelcome(@Body() Welcome welcome);
}

@JsonSerializable(createToJson: true, createFactory: true, includeIfNull: true)
class UserEntity {
  String id;
  String? name;
  String? avatar;
  String? createdAt;

  UserEntity({required this.id, this.name, this.avatar, this.createdAt});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable(createToJson: true, createFactory: true, includeIfNull: true)
class TaskEntity {
  String id;
  String? name;
  String? avatar;
  String? createdAt;

  TaskEntity({required this.id, this.name, this.avatar, this.createdAt});

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);
}

@JsonSerializable(createToJson: true, createFactory: true, includeIfNull: true)
class PostEntity {
  String? id;
  @JsonKey(name: 'full_name')
  String? name;
  String? avatar;

  PostEntity({required this.id, this.name, this.avatar});

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}
