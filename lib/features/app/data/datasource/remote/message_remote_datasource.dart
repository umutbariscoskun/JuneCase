import 'package:dio/dio.dart';
import 'package:mutlumesaj/core/constants/data_constants.dart';
import 'package:mutlumesaj/features/app/data/model/message_model.dart';

import 'package:retrofit/retrofit.dart';

part 'message_remote_datasource.g.dart';

@RestApi()
abstract class MessageRemoteDataSource {
  factory MessageRemoteDataSource(Dio dio, {String baseUrl}) =
      _MessageRemoteDataSource;

  // @POST(DataConstants.messagesEndpoint)
  // Future<MessageModel> addMessage({
  //   @Body() required Map<String, dynamic> body,
  // });

  @GET(DataConstants.messagesEndpoint)
  Future<List<MessageModel>> getMessages({
    @Query('page') required int page,
    @Query('limit') int limitForPerPage = DataConstants.paginationLimit,
  });

  @PUT('${DataConstants.messagesEndpoint}/{id}')
  Future<MessageModel> updateMessage({
    @Path('id') required String id,
    @Body() required Map<String, dynamic> body,
  });

  // @DELETE('${DataConstants.messagesEndpoint}/{id}')
  // Future<MessageModel> removeMessage({@Path('id') required String id});
}
