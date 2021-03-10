import 'package:flutter/material.dart';
import 'package:swamedia_test/src/models/post-model.dart';

class PostListItem extends StatefulWidget {
  const PostListItem({Key key, @required this.post, this.length, this.text})
      : super(key: key);

  final PostModel post;
  final int length;
  final String text;

  @override
  _PostListItemState createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${widget.post.id}', style: textTheme.caption),
      title: Text(widget.post.title),
      isThreeLine: true,
      subtitle: Text(widget.post.body),
      dense: true,
    );
  }
}
