import 'package:jsonplaceholder_provider/core/enums/viewstate.dart';
import 'package:jsonplaceholder_provider/core/models/post.dart';
import 'package:jsonplaceholder_provider/core/services/posts_service.dart';
import 'package:jsonplaceholder_provider/locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}