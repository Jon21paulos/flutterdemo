import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/route/route_generator.dart';
import 'package:simpleproject/store/connectivity_provider.dart';
import 'package:simpleproject/store/email_auth_provider.dart';
import 'package:simpleproject/store/fetch_user_provider.dart';
import 'package:simpleproject/store/image_provider.dart';
import 'package:simpleproject/store/phone_auth_provider.dart';
import 'package:simpleproject/utils/constants/theme_data.dart';
import 'store/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
     importance: Importance.high,
     playSound: true
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main()  async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => PhoneAuthService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<PhoneAuthService>().authStateChanges, initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => FetchUser()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (_) => ImageUploader()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //check internet connection
    Provider.of<ConnectivityProvider>(context).startMonitoring();

    return GestureDetector(
      onTap: () {
        //dismiss keyboard on tab
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
                title: 'Simple Project Demo',
                debugShowCheckedModeBanner: false,
                theme: context.watch<ThemeNotifier>().darkTheme? dark:light,
                initialRoute: "/",
                onGenerateRoute: RouteGenerator.generateRoute ,
              ),
       );
    }
}
