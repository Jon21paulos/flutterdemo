import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simpleproject/store/email_auth_provider.dart';
import 'package:simpleproject/store/image_provider.dart';
import 'package:simpleproject/store/theme_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          UserAccountsDrawerHeader(
            accountName:  Text(user!.uid.toString()),
            accountEmail:  user.email == null? Text(user.phoneNumber.toString()):
                                               Text(user.phoneNumber.toString()),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            //check if user logged with either otp or email
            currentAccountPicture: StreamBuilder(
                  stream:
                    FirebaseFirestore.instance.collection("users").doc(user.uid).collection("images").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange,
                          child: Text(
                            "P",
                            style: TextStyle(fontSize: 40.0),
                          ),
                        );
                      }else {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context,int index){

                            String url=snapshot.data!.docs[index]["downloadUrl"];

                            return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    View(url:url)
                                  ),);
                            
                                },
                              child: Hero(
                                tag: url,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(url),
                                        ),
                                      ),
                                    );
                                  }
                              );
                          }
                      }
                  ),
                ),
              ListTile(
                leading: Text('change profile',style: Theme.of(context).textTheme.subtitle1,),
                trailing: IconButton(
                    onPressed: (){
                      context.read<ImageUploader>().getImage(context);
                    },
                    icon:  Icon(Icons.edit,color: Theme.of(context).iconTheme.color)),
                  ),

              SwitchListTile(
                  title: Text('Dark Mode',style: Theme.of(context).textTheme.subtitle1,),
                  value: context.watch<ThemeNotifier>().darkTheme,
                  onChanged: (val){
                    context.read<ThemeNotifier>().toggleTheme();
                  }
              ),
              ListTile(
                leading:  Icon(Icons.contacts,color: Theme.of(context).iconTheme.color),
                title: const Text("Users"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.settings,color: Theme.of(context).iconTheme.color),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.contacts,color: Theme.of(context).iconTheme.color),
                title: const Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.logout ,color: Theme.of(context).iconTheme.color),
                title: const Text("Logout"),
                onTap: () {
                  context.read<AuthenticationService>().signOut();
                },
              ),
            ],
         ),
    );
  }
}

class View extends StatelessWidget {
 final url;
  const View({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Hero(tag: url,
        child: Image.network(url));
  }
}
