import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../Providers/home_data_provider.dart';

class ProvidersList {
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(
        create: (ctx) => HomeDataProvider(),
      ),
    ];
  }
}
