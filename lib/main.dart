import 'package:flutter/material.dart';
import 'style/style.dart';
import 'page/home.dart';
import 'routes/routes.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/store.dart';
import 'model/app_state.dart';
import 'model/user.dart';
import 'utils/local_storage.dart';
import 'store/app_action.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    //配置路由
    Routes.configureRoutes();
    _getUser();
  }

  _getUser() async {
    User user = await LocalStorage.getUser();
    store.dispatch(new LoginAction(user));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new StoreProvider<AppState>(
        store: store,
        child: new Home()
      ),
      theme: new ThemeData(
        primaryColor: Style.primaryColor,
      ),
    );
  }
}
