import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';



class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  void navigateToComingSoon(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ComingSoonView()), // تأكد من استيرادها بشكل صحيح
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
      backgroundColor:  Colors.white,
        title: const Text('My account', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                    color: const Color(0xFF670977),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(radius: 24, backgroundColor: Colors.white,child: Icon(Icons.person, size: 32 , color: Colors.black,)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ARSANY MORCOS', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text('arsantimorcos88@gmail.com', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () => navigateToComingSoon(context),
                    child:  Text('Edit' ,style: TextStyle(color: Colors.black,),),
                  )
                ],
              ),
            ),
            buildSectionTitle('General Settings'),
            buildMenuItem(Icons.notifications, 'Notifications', context),
            buildMenuItem(Icons.person, 'Personal Informations', context),
            buildMenuItem(Icons.people, 'Invite Friends', context),
            buildMenuItem(Icons.language, 'Language', context),
            buildSectionTitle('Security & Privacy'),
            buildMenuItem(Icons.security, 'Security', context),
            buildMenuItem(Icons.help, 'Help Center', context),
            buildSectionTitle('Log Out'),
            buildMenuItem(Icons.logout, 'Log Out', context),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget buildMenuItem(IconData icon, String title, BuildContext context) {
    return InkWell(
      onTap: () => navigateToComingSoon(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
