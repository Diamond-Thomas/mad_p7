import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileScreen()
    );
  }
}




class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Manager'),
      ),
      body: const UserBanner(),
    );
  }
}

class UserBanner extends StatelessWidget {
  const UserBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text('Welcome, Guest!'),
        FavoriteButton(),
      ]
    );
  }
}


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
     icon: Icon(
        _isFavorited ? Icons.star : Icons.star_border,
        color: _isFavorited ? Colors.amber : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isFavorited = !_isFavorited;
        });
      }, 
    );
  
  }
} 


