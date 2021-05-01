import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PageRoots { entory, signIn, signUp, menu }

final StateProvider<PageRoots> navigationProvider =
    StateProvider<PageRoots>((ref) => PageRoots.entory);
