import 'package:equatable/equatable.dart';

class MyUserEntities extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? image;

  const MyUserEntities({
    required this.id,
    required this.email,
    required this.name,
    this.image,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'image': image,
    };
  }

  static MyUserEntities fromDocument(Map<String, dynamic> doc) {
    return MyUserEntities(
        id: doc['id'] as String,
        email: doc['email'] as String,
        name: doc['name'] as String,
        image: doc['image'] as String);
  }


  @override
  String toString(){
    return '''UserEntity:(
    id : $id,
    email: $email,
    name: $name,
    image:$image,
    )''';
  }

  @override
  List<Object?> get props => [id, email, name, image];
}
