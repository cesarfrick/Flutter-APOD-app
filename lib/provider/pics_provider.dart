import 'package:apod_gallery/provider/pics_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final picsProvider =
    ChangeNotifierProvider<PicsNotifier>((_) => PicsNotifier());
