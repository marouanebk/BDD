import 'package:frontend/chat/domaine/entities/conversation_entity.dart';

class ConversationModel extends ConversationEntity {
  const ConversationModel({
    required String conversationId,
    required String sender,
    required String reciever,

    // required String teacherName,
  }) : super(
          conversationId: conversationId,
          sender: sender,
          reciever: reciever,

          // teacherName: teacherName,
        );

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      conversationId: json["_id"],
      sender: json["users"][0].toString(),
      reciever: json["users"][1].toString(),

      // teacherName: json["teacherName"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "title": title,
  //     "year": year,
  //     "description": description,
  //     "courseContent": {
  //       "name": courseContent[0].name.toString(),
  //       "type": courseContent[0].type.toString(),
  //       "url": courseContent[0].url.toString(),
  //       // "quizz": courseContent[0].quiz.toString(),
  //     },

  //     "user": teacherId,
  //   };
  // }
}
