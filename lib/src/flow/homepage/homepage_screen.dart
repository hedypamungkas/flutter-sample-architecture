import 'package:flutter/material.dart';
import 'homepage_bloc.dart';
import '../../model/posts.dart';
import '../../widget/utils_widget.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  HomepageBloc bloc;

  @override
  void initState() {
    bloc = HomepageBloc();
    bloc.request();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Homepage", style: TextStyle(fontSize: 15.0)),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(26, 28, 64, 1)
          ),
        body: _initBuild());
  }

  Widget _initBuild() {
    return StreamBuilder<Posts>(
      stream: bloc.currentPosts,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return UtilsErrorWidget(text: snapshot.error.toString());
        }

        if (!snapshot.hasData) {
          return UtilsLoadingWidget(color: Colors.blue);
        }

        return SafeArea(
          child: _bodyBuild(snapshot.data),
        );
      },
    );
  }

  Widget _bodyBuild(Posts data) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: data.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return _contentBuild(data.posts[index]);
      },
      separatorBuilder: (BuildContext context, _ ) {
        return Divider(height: 30, color: Colors.white);
      },
    );
  }

  Widget _contentBuild(Post post) {
    return ListTile(
      dense: true,
      title: Text(
        post.title,
        style: TextStyle(
          color: post.titleColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        post.subtitle,
        style: TextStyle(
          color: post.subtitleColor
        ),
      ),
    );
  }
}