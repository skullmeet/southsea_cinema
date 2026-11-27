import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});




  
  @override
  State<SettingsView> createState() {
    return _SettingsViewState();
  }
}
  
class _SettingsViewState extends State<SettingsView>{

  late TextEditingController  _addressController;
  late TextEditingController _patronNumberController;
  late TextEditingController _emailController;
  bool _receiveNews = false;
  String _confirmationMessage = '';

  void _clearAll() {
  _addressController.clear();
  _emailController.clear();
  _patronNumberController.clear();

  setState(() {
    _receiveNews = false;
    _confirmationMessage = '';
  });
}

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _patronNumberController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose(){
    _addressController.dispose();
    _patronNumberController.dispose();
    _emailController.dispose();
    super.dispose();

  }

  void _saveSettings(){
    final String address = _addressController.text.trim();
    final String patronNumber = _patronNumberController.text.trim();
    final String email = _emailController.text.trim();

    final userSettings settings = userSettings(
      address: address,
      patronNumber: patronNumber,
      email: email,
      receiveNews: _receiveNews,

    );

    setState(() {
      _confirmationMessage = 'Settings Saved for ${settings.patronNumber}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Customer Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 16),

            //Addresssss
            Text(style: TextStyle(color: cinemaFontMuted,fontSize: 15),'Address'),
            TextField(
              controller: _addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Address',
              ),
            ),
            const SizedBox(height: 16),

            //emailllll
            Text(style: TextStyle(color: cinemaFontMuted,fontSize: 15),'Email'),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Email ',
              ),
            ),
            const SizedBox(height: 16),
            //Patronnnnnnnn
            Text(style: TextStyle(color: cinemaFontMuted,fontSize: 15),'Patron Number'),
            TextField(
              controller: _patronNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Patron Number',
              ),
            ),
            const SizedBox(height: 16),
            //newsssssss

            Row(
              children: [
                const Expanded(
                  child: Text('Receive newsletter and offers'),
                ),
                Switch(
                  value: _receiveNews,
                  onChanged: (bool value) {
                    setState(() {
                      _receiveNews = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ////savvveeeeeee
            Row(
              children: [
                SecondaryButton(label: 'Cancel', onPressed: _clearAll),
                SizedBox(width: 20,),
                PrimaryButton(label: 'Save Settings', onPressed: _saveSettings),
              ],
            ),
            if (_confirmationMessage.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                _confirmationMessage,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
              ]
            )
        )
    );
  }

}
