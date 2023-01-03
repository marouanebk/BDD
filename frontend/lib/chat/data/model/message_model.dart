import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required String conversationId,
    required String sender,
    DateTime? createdAt,
    required String message,

    // required String teacherName,
  }) : super(
            conversationId: conversationId,
            sender: sender,
            createdAt: createdAt,
            message: message

            // teacherName: teacherName,
            );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        conversationId: json["convesation_id"],
        sender: json["sender"],
        createdAt: DateTime.parse(json["createdAt"]),
        message: json["message"]["text"]

        // teacherName: json["teacherName"],
        );
  }

  Map<String, dynamic> toJson() {
    return {"from": sender, "conversation": conversationId, "message": message};
  }
}
