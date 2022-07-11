import 'package:nested/nested.dart';
import 'package:vipratechuserauth/features/authentication/services/login_provider.dart';
import "package:provider/src/change_notifier_provider.dart";
import 'package:vipratechuserauth/features/authentication/services/registration_provider.dart';
import 'package:vipratechuserauth/features/summary/services/summary_provider.dart';

class Providers {
  static List<SingleChildWidget> get providerList => [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) {
            return LoginProvider();
          },
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) {
            return RegistrationProvider();
          },
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) {
            return SummaryProvider();
          },
        )
      ];
}
