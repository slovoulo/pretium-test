import 'package:flutter/material.dart';

import '../dioServices/dioPostService.dart';
import '../models/utilityModel.dart';
class UtilitiesScreen extends StatefulWidget {
  const UtilitiesScreen({super.key});

  @override
  State<UtilitiesScreen> createState() => _UtilitiesScreenState();
}

class _UtilitiesScreenState extends State<UtilitiesScreen> {

  List<UtilityData> utilities = [];
  bool isFetching = false;

  @override
  void initState() {
    fetchUtilities();
    super.initState();
  }

  /// Fetch utilities from API
  Future<void> fetchUtilities() async {
    setState(() {
      isFetching = true;
    });

    try {
      final response = await DioPostService().fetchUtilities(); // Use your Dio function here

      if (response.statusCode == 200) {
        final rawData = response.data['data'] as List;
        setState(() {
          utilities = rawData
              .map((utilityJson) => UtilityData.fromJson(utilityJson))
              .toList();
          isFetching = false;
        });
      } else {
        throw Exception('Failed to load utilities');
      }
    } catch (e) {
      setState(() {
        isFetching = false;
      });
      print('Error fetching utilities: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilities'),
      ),
      body: isFetching
          ? Center(child: CircularProgressIndicator())
          : utilities.isEmpty
          ? Center(child: Text('No utilities available'))
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75, // Adjust this for item height
          ),
          itemCount: utilities.length,
          itemBuilder: (context, index) {
            final utility = utilities[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        utility.icon, // Display the utility icon
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          utility.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Category: ${utility.category}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Limit: ${utility.lowLimit} - ${utility.highLimit}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
