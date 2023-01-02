import 'package:dartz/dartz.dart';
import 'package:frontend/chat/domaine/entities/conversation_entity.dart';
import 'package:frontend/chat/domaine/entities/message_entity.dart';

import 'package:frontend/cores/error/failure.dart';

abstract class BaseChatRepository {
  // Future<Either<Failure, List<Course>>> getSuggestedCourses();
  // Future<Either<Failure, CourseDetails>> getCourseDetail(String id);

  // Future<Either<Failure, Unit>> addCourse(CourseDetails courseDetails);
  Future<Either<Failure, Unit>> addConversation(String toId);
  Future<Either<Failure, List<ConversationEntity>>> getAllConversations();
  Future<Either<Failure, List<MessageEntity>>> getMessages(String id);

  // Future<Either<Failure, List<Course>>> getCourseByTeacher(String id);
}
