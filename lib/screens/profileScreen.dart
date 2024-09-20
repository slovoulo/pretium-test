import 'package:flutter/material.dart';
import 'package:pretiumtest/dioServices/dioPostService.dart'; // Your Dio service
import 'package:pretiumtest/models/profileModel.dart';
import 'package:pretiumtest/widgets.dart'; // Profile model location

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileData? profile;
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  /// Fetch profile information
  Future<void> fetchProfile() async {
    setState(() {
      isFetching = true;
    });

    try {
      final response = await DioPostService().fetchprofileInfo(); // Your Dio function

      if (response.statusCode == 200) {
        setState(() {
          profile = ProfileResponse.fromJson(response.data).data;
          isFetching = false;
        });
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      setState(() {
        isFetching = false;
      });
      print('Error fetching profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: isFetching
          ? Center(child: CircularProgressIndicator())
          : profile == null
          ? Center(child: Text('No profile data available'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(alignment: Alignment.center,
          child: Column(


            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: profile!.avatar == null
                    ? AssetImage('assets/images/user.png')
                    : NetworkImage(profile!.avatar!) as ImageProvider,
              ),
              SizedBox(height: 16),
              Text(
                '${profile!.firstName} ${profile!.lastName}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              profileItem(value: profile!.email, key: "Email"),
              profileItem(value: profile!.mobile, key: 'Mobile'),
              profileItem(value: profile!.gender, key: 'Gender'),
              profileItem(value: profile!.dob, key: 'D.O.B'),
              profileItem(value: profile!.idNo, key: 'ID'),
              profileItem(value: profile!.country.name, key: 'Country'),
              profileItem(value: profile!.country.phoneCode, key: 'Phone Code'),
              profileItem(value: profile!.country.currencyCode, key: 'Currency'),

            ],
          ),
        ),
      ),
    );
  }
}
