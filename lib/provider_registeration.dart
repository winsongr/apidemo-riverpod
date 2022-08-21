import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_provider.dart';

final productProvider =
    ChangeNotifierProvider.autoDispose((ref) => ProductProvider(ref));
