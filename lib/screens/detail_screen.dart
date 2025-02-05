import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final dynamic user;

  const DetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "${user['firstName']} ${user['lastName']}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
             
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Email: ${user['email']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Phone: ${user['phone']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Gender & Age: ${user['gender']} / ${user['age']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Address: ${user['address']['address']}, ${user['address']['city']}, ${user['address']['state']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),
              Divider(thickness: 1.5),

              // company details
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Company: ${user['company']['name']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Department: ${user['company']['department']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Title: ${user['company']['title']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Divider(thickness: 1.5),

              // bank details
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Bank: ${user['bank']['name']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  "Account Number: ${user['bank']['accountNumber']}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
