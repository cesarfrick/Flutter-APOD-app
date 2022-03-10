import 'package:apod_gallery/provider/pics_notifier.dart';
import 'package:apod_gallery/provider/pics_provider.dart';
import 'package:flutter/material.dart';

import 'package:apod_gallery/services/picture_service.dart';
import 'package:apod_gallery/components/picture_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _pictures = ref.watch(picsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
        backgroundColor: Colors.pink,
      ),
      body: _pictures.loadState == LoadingState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                actions: const [
                  Icon(Icons.search),
                ],
                backgroundColor: Colors.pinkAccent,
                flexibleSpace: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    height: 2,
                  ),
                  onChanged: (text) {
                    _pictures.filterPics(text);
                  },
                ),
                pinned: true,
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PictureCard(
                    picture: _pictures.pics[index],
                  ),
                  childCount: _pictures.pics.length,
                ),
              ),
            ]),
    );
  }
}
