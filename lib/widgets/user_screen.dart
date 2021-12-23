import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/store/fetch_user_provider.dart';
import 'components/custom_card.dart';
import 'components/custom_card_skeletal.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
 final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<FetchUser>().fetchUser;

    _scrollController.addListener(() {
      if(_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent){
           context.read<FetchUser>().fetchUser;
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        context.read<FetchUser>().initialValues();
        context.read<FetchUser>().fetchUser;
      },
      child: Center(
          child: Consumer<FetchUser>(
            builder: (context,value,child){
              return value.users.isEmpty && !value.error
                  ? ListView.builder(
                        itemCount: 7,

                        itemBuilder: (context,index){
                          return const CustomCardSkeletal();
                        })

                        : value.error ?

                        Text(
                          'oops something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1
                        )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: value.users.length + 1,
                            itemBuilder: (context,index){
                              if(index == value.users.length ){
                                return context.read<FetchUser>().message?
                                          const CupertinoActivityIndicator():
                                         const Padding(
                                           padding:  EdgeInsets.all(8.0),
                                           child: Center(child: Text('no more data')),
                                         );
                              }
                              final user = value.users[index];
                              return CustomCard(user: user);
                            },
                  );
            },
          ),
        ),
    );
  }
}
