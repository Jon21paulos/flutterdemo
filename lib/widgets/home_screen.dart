import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simpleproject/widgets/user_screen.dart';
import '../main.dart';
import 'about_screen.dart';
import 'components/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
         }
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "Wellcome ",
        "How are you ?",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher'
            )
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar:  AppBar(
            title: Text("Wellcome", style: Theme.of(context).textTheme.subtitle1),
            backgroundColor: Theme.of(context).colorScheme.primary,
            bottom:  TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts,color: Theme.of(context).iconTheme.color), text: "Users"),
                Tab(icon: Icon(Icons.attribution_outlined,color: Theme.of(context).iconTheme.color), text: "About"),
                ],
            )
          ),
        body:  TabBarView(
              children: [
                   UserScreen(),
                   const AboutScreen(),
               ],
        ),
        drawer:  Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).colorScheme.primary
            ),
            child: const CustomDrawer()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          tooltip: 'Notification',
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
