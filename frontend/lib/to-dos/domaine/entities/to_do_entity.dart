import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String? userid;
  final String description;
  final String etat;

  const ToDo({
    this.userid,
    required this.description,
    required this.etat,
  });

  @override
  List<Object?> get props => [
        userid,
        description,
        etat,
      ];
}
