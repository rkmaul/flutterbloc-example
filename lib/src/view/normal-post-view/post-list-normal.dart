import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-bloc.dart';
import 'package:swamedia_test/src/bloc/post-normal-bloc/post-normal-state.dart';
import 'package:swamedia_test/src/view/normal-post-view/post-list-item-normal.dart';

class PostListNormal extends StatefulWidget {
  final int length;
  final String text;
  PostListNormal({this.length, this.text});

  @override
  _PostListNormalState createState() => _PostListNormalState();
}

class _PostListNormalState extends State<PostListNormal> {
  // final _scrollController = ScrollController();
  // PostNormalBloc _postNormalBloc;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // _postNormalBloc = context.read<PostNormalBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostNormalBloc, PostStateNormal>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatusNormal.failure:
            return const Center(child: Text('Failed to fetch posts'));
          case PostStatusNormal.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('No posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PostListItemNormal(
                  post: state.posts[index],
                  length: widget.length,
                  text: widget.text,
                );
              },
              itemCount: state.posts.length,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
