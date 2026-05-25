import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Guest User',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Complete profile after backend integration',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Saved Addresses'),
          subtitle: Text('Manage delivery points from map tab'),
        ),
        const ListTile(
          leading: Icon(Icons.receipt_long_outlined),
          title: Text('Order History'),
          subtitle: Text('Connect to API to load user orders'),
        ),
        const ListTile(
          leading: Icon(Icons.support_agent_outlined),
          title: Text('Help & Support'),
          subtitle: Text('Add FAQ and support channels'),
        ),
      ],
    );
  }
}
