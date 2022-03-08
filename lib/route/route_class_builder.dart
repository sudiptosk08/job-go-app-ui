import 'package:application/view/screen/applications_screen.dart';
import 'package:application/view/screen/home_screen.dart';
import 'package:application/view/screen/notification_screen.dart';
import 'package:application/view/screen/profile_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class RouteClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<ProfileScreen>(() => ProfileScreen(dataPass: true));
    register<ApplicationScreen>(() => ApplicationScreen());
    register<NotificationScreen>(() => NotificationScreen(dataPass: true));
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
