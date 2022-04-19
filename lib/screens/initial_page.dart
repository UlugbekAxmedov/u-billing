import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.description_rounded,
              color: Color(0xFFDADADA),
              size: 100,
            ),
            SizedBox(height: 16,),
            Text(
              'No contracts are made',
              style: TextStyle(
                color: Color(0xFFDADADA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
