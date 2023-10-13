import 'package:flutter/material.dart';

class Produkdetail extends StatelessWidget {
  final String fullname;
  final String Email;
  final String alamat;
  final String tanggal;
  final int ID;
  final int nohp;

  const Produkdetail({
    Key? key,
    required this.fullname,
    required this.Email,
    required this.alamat,
    required this.tanggal,
    required this.ID,
    required this.nohp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail produk'),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem('Fullname', fullname),
              _buildDetailItem('Email', Email),
              _buildDetailItem('Alamat', alamat),
              _buildDetailItem('Tanggal', tanggal),
              _buildDetailItem('ID', ID.toString()),
              _buildDetailItem('Phone Number', nohp.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
