import 'dart:math';
import 'package:flutter/material.dart';
import '../api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _users;
  List<dynamic> _filteredUsers = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _users = ApiService.fetchUsers();
    _users.then((users) {
      if (mounted) {
        setState(() {
          _filteredUsers = users;
        });
      }
    });
  }

  void _filterUsers(String query, List<dynamic> users) {
    setState(() {
      _filteredUsers = users
          .where((user) =>
              user['firstName'].toLowerCase().contains(query.toLowerCase()) ||
              user['lastName'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search Users...",
            prefixIcon: Icon(Icons.search),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (query) {
            _users.then((users) => _filterUsers(query, users));
          },
        ),
        // title: Text("Users"),
        // centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          }

          return _filteredUsers.isEmpty
              ? Center(child: Text("No results found"))
              : ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    var user = _filteredUsers[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(user: user),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              Text(
                                "${user['firstName']} ${user['lastName']}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                user['email'],
                                style: TextStyle(fontSize: 12,),
                              ),
                              // Text(
                              //   user['phone'],
                              //   style: TextStyle(fontSize: 14),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
