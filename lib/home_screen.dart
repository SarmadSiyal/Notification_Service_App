import 'package:flutter/material.dart';
import 'dart:async';
import 'notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int countdown = 0;
  Timer? _timer;

  void startCountdown() {
    setState(() => countdown = 10);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown <= 0) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Service"),
        centerTitle: true,
        backgroundColor: const Color(0xFFCBF1F5),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3FDFD), Color(0xFFCBF1F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton("Trigger Notification", Icons.notifications_active,
                    () {
                  NotificationService().showInstantNotification(
                    title: "Hey!",
                    body: "This is your instant notification.",
                  );
                }),
                const SizedBox(height: 16),
                _buildButton(
                    countdown > 0
                        ? "Scheduled in $countdown sec"
                        : "Schedule Notification (10s)",
                    Icons.schedule, () {
                  NotificationService().scheduleNotification(
                    title: "Reminder",
                    body: "This is a scheduled notification.",
                    seconds: 10,
                  );
                  startCountdown();
                }),
                const SizedBox(height: 16),
                _buildButton("Cancel All Notifications", Icons.cancel, () {
                  NotificationService().cancelAllNotifications();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String title, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
      ),
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
