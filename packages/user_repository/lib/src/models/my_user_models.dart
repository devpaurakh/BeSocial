import 'package:equatable/equatable.dart';

import '../entities/my_user_entities.dart';

class MyUserModels extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? image;

  const MyUserModels({
    required this.id,
    required this.email,
    required this.name,
    this.image,
  });

  static const empty = MyUserModels(
      id: "",
      email: "",
      name: "",
      image:
          ""); // this is the empty method called MyuserModel which modify the myusermodel paramater

//this is copy with method of the usermodel
  MyUserModels copyWith(
      {String? id, String? email, String? name, String? image}) {
    return MyUserModels(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        image: image ?? this.image);
  }

  //getter to determin if the current user is empty
  bool get isEmpty => this == MyUserModels.empty;

  //getter to determin if the current user is not empty

  bool get isNotEmpty => this != MyUserModels.empty;

  MyUserEntities toUserEntity() {
    return MyUserEntities(
      id: id,
      email: email,
      name: name,
      image: image,
    );
  }

  static MyUserModels fromEitity(MyUserEntities entities) {
    return MyUserModels(
        id: entities.id,
        email: entities.email,
        name: entities.name,
        image: entities.image);
  }

  @override
  List<Object?> get props => [id, email, name, image];
}
