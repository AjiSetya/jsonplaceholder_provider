import 'package:jsonplaceholder_provider/core/enums/viewstate.dart';
import 'package:jsonplaceholder_provider/core/models/comment.dart';
import 'package:jsonplaceholder_provider/core/services/api.dart';
import 'package:jsonplaceholder_provider/locator.dart';

import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}