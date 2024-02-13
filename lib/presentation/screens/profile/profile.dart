import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile'),
            InkWell(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(const AuthEvent.logout());
                // context.read<AuthBloc>().add(AuthEvent.logout());
              },
              child: Container(
                  color: Colors.purple,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('logout'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}