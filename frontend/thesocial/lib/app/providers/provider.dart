import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:thesocial/core/notifier/authentication.notifier.dart';
import 'package:thesocial/core/notifier/utility.notifier.dart';

List<SingleChildWidget> providers = [...remoteProvider];

List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => UtilityNorifier()),
];
