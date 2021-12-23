import 'package:flutter/material.dart';

Widget buttonItem(context, changeState) {
  return InkWell(
    onTap: (){
       changeState();
    },
    child: SizedBox(
      height: 60,
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(
                Icons.phone,
                size: 40,
                color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "continue with phone",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}