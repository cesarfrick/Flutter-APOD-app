import 'package:apod_gallery/provider/pics_notifier.dart';
import 'package:apod_gallery/provider/pics_provider.dart';
import 'package:flutter/material.dart';

import 'package:apod_gallery/components/picture_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _filterController = TextEditingController();

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
      body: _getBodyContent(_pictures),
    );
  }

  Widget _getBodyContent(PicsNotifier _pictures) {
    if (_pictures.loadState == LoadingState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_pictures.loadState == LoadingState.isLoaded) {
      return CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          floating: true,
          actions: [
            _filterController.text.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.search),
                  )
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _filterController.clear();
                      _pictures.restorePics();
                    },
                  ),
          ],
          backgroundColor: Colors.pinkAccent,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0, top: 10.0),
            child: TextField(
              controller: _filterController,
              decoration: null,
              cursorColor: Colors.white,
              autofillHints: _pictures.pics.map((pic) => pic.title),
              style: const TextStyle(
                color: Colors.white,
                height: 2,
              ),
              onChanged: (text) {
                _pictures.filterPics(text);
              },
            ),
          ),
        ),
        _getContentWidget(_pictures),
      ]);
    }

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, size: 72, color: Colors.red),
        Text(
          _pictures.err,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

  Widget _getContentWidget(PicsNotifier _pictures) {
    return _pictures.pics.isNotEmpty
        ? SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: SliverGrid(
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
          )
        : SliverFillRemaining(
            child: Center(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('No elements match your search',
                  style: TextStyle(fontSize: 18, height: 4)),
              Icon(Icons.image_not_supported, color: Colors.black38, size: 72),
            ],
          )));
  }
}
