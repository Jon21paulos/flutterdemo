import 'package:flutter/material.dart';
import 'package:simpleproject/models/user_model.dart';

class CustomCard extends StatelessWidget {

  const CustomCard({Key? key, required this.user}) : super(key: key);
  final Datum user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(user.avatar),

                const SizedBox(width: 20),

                Column(
                  children: [
                    Text(user.firstName +"  "+ user.lastName,style: Theme.of(context).textTheme.headline6,),
                    Text(user.email,style: Theme.of(context).textTheme.subtitle1,)
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
