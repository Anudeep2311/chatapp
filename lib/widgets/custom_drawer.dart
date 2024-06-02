import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  title: const Text("C H A T S"),
                  leading: const Icon(Icons.sms_outlined),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout_outlined),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }
}
