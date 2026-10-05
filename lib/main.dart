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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  String _currentUsername = 'Guest';

  void _updateUsername(String newName) {
    setState(() {
      _currentUsername = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Manager'),
      ),
      body: Column(
        children: [
          UserBanner(username: _currentUsername),
          ProfileForm(onSaveUsername: _updateUsername),
        ],
      ),
    );
  }
}

class UserBanner extends StatelessWidget {
  const UserBanner({
    super.key,
    required this.username,
  });
  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text('Welcome, $username!'),
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

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    super.key,
    required this.onSaveUsername,
  });
  final ValueChanged<String> onSaveUsername;
  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Form(
    key: _formKey,
    child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Username cannot be empty';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSaveUsername(_usernameController.text.trim());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Profile saved: ${_usernameController.text}'),
                  ),
                );
              }
            },
            child: const Text('Save Profile'),
          ),
        ],
      ),);}

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

}




