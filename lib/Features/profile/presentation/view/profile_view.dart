import 'package:flutter/material.dart';
import '../../../../Core/routes/app_rout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B121F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF007BFF), width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/trainning.png'),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Color(0xFF007BFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 2. User Info
            const Text(
              'Alex Rivera',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'alex.rivera@ironpulse.com',
              style: TextStyle(color: Color(0xFF5A6982), fontSize: 14),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfileScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Edit Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 32),
            Row(
              children: [
                _buildStatCard(
                  title: 'Plans Completed',
                  value: '5',
                  icon: Icons.check_circle_outline,
                  iconColor: Colors.blue,
                ),
                const SizedBox(width: 16),
                _buildStatCard(
                  title: 'Workout Hours',
                  value: '120',
                  icon: Icons.access_time,
                  iconColor: Colors.blueAccent,
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            _buildSettingsTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              iconBgColor: Colors.blue.withOpacity(0.2),
              iconColor: Colors.blue,
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.security_outlined,
              title: 'Privacy & Security',
              iconBgColor: Colors.indigo.withOpacity(0.2),
              iconColor: Colors.indigoAccent,
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.language_outlined,
              title: 'Language',
              trailingText: 'English',
              iconBgColor: Colors.blueGrey.withOpacity(0.2),
              iconColor: Colors.blueGrey,
              onTap: () {},
            ),

            _buildSettingsTile(
              icon: Icons.logout_outlined,
              title: 'Sign Out',
              iconBgColor: Colors.red.withOpacity(0.1),
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () async {
                Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required IconData icon, required Color iconColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C222E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required Color iconBgColor,
    required Color iconColor,
    String? trailingText,
    Color textColor = Colors.white,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Text(trailingText, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}