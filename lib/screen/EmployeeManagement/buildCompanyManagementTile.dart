import 'package:flutter/material.dart';

class buildCompanyManagementTile extends StatefulWidget {
  const buildCompanyManagementTile({super.key});

  @override
  State<buildCompanyManagementTile> createState() =>
      _buildCompanyManagementTileState();
}

class _buildCompanyManagementTileState
    extends State<buildCompanyManagementTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text('Company Management'),
        children: [
          ListTile(
            title: Text('Edit Company Details'),
            onTap: () {
              // Implement edit company details functionality
            },
          ),
        ],
      ),
    );
  }
}
