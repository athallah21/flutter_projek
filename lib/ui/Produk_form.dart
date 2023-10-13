// import 'package:flutter_projek/ui/Produk_detail.dart';
// import 'package:flutter/material.dart';

// class Produkform extends StatefulWidget {
//   const Produkform({Key? key}) : super(key: key);

//   @override
//   _ProdukformState createState() => _ProdukformState();
// }

// class _ProdukformState extends State<Produkform> {
//   final _fullnameTextboxController = TextEditingController();
//   final _emailTextboxController = TextEditingController();
//   final _phonenumberTextboxController = TextEditingController();
//   final _IDnumberTextboxController = TextEditingController();
//   final _addressTextboxController = TextEditingController();
//   DateTime? _selectedDate;
//   String? verificationError;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Formulir Personal'),
//         actions: [
//           IconButton(
//             icon: Image.network(
//               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXlaobvxKtT5bj03jC01ceVWElMLa3dhABj2hXyby1bieR0-jmC6treYP9nWXaOx8fwk&usqp=CAU',
//             ),
//             onPressed: () {
//               if (isValidPhoneNumber(_phonenumberTextboxController.text)) {
//                 String fullname = _fullnameTextboxController.text;
//                 String email = _emailTextboxController.text;
//                 int nohp =
//                     int.tryParse(_phonenumberTextboxController.text) ?? 0;
//                 int IDnumber =
//                     int.tryParse(_IDnumberTextboxController.text) ?? 0;
//                 String alamat = _addressTextboxController.text;
//                 String tanggal = _selectedDate != null
//                     ? "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}"
//                     : "";

//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => Produkdetail(
//                     fullname: fullname,
//                     Email: email,
//                     nohp: nohp,
//                     ID: IDnumber,
//                     alamat: alamat,
//                     tanggal: tanggal,
//                   ),
//                 ));
//               } else {
//                 setState(() {
//                   verificationError = "Nomor telepon tidak valid";
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding:
//             const EdgeInsets.all(16.0), // Padding umum untuk seluruh formulir
//         child: Column(
//           children: [
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _buildTextField(_fullnameTextboxController, "Nama Lengkap"),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _buildTextField(_emailTextboxController, "Email"),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _buildTextField(_phonenumberTextboxController, "Nomor Telepon"),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _buildTextField(_IDnumberTextboxController, "Nomor Identitas"),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _buildTextField(_addressTextboxController, "Alamat"),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _textboxTanggal(),
//             SizedBox(height: 16.0), // Menambahkan jarak
//             _tombolSimpan(),
//             if (verificationError != null)
//               Text(
//                 verificationError!,
//                 style: TextStyle(color: Colors.red),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         decoration: InputDecoration(labelText: label),
//         controller: controller,
//       ),
//     );
//   }

//   Widget _textboxTanggal() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Text("Tanggal: "),
//           ElevatedButton(
//             onPressed: () {
//               _selectDate(context);
//             },
//             child: Text(
//               _selectedDate != null
//                   ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
//                   : "Pilih Tanggal",
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Widget _tombolSimpan() {
//     return ElevatedButton(
//       onPressed: () {
//         if (isValidPhoneNumber(_phonenumberTextboxController.text)) {
//           String fullname = _fullnameTextboxController.text;
//           String email = _emailTextboxController.text;
//           int nohp = int.tryParse(_phonenumberTextboxController.text) ?? 0;
//           int IDnumber = int.tryParse(_IDnumberTextboxController.text) ?? 0;
//           String alamat = _addressTextboxController.text;
//           String tanggal = _selectedDate != null
//               ? "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}"
//               : "";

//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => Produkdetail(
//               fullname: fullname,
//               Email: email,
//               nohp: nohp,
//               ID: IDnumber,
//               alamat: alamat,
//               tanggal: tanggal,
//             ),
//           ));
//         } else {
//           setState(() {
//             verificationError = "Nomor telepon tidak valid";
//           });
//         }
//       },
//       child: const Text('Simpan'),
//     );
//   }

//   bool isValidPhoneNumber(String phone) {
//     return phone.length == 12;
//   }
// }

import 'package:flutter_projek/ui/Produk_detail.dart';
import 'package:flutter/material.dart';

class Produkform extends StatefulWidget {
  const Produkform({Key? key}) : super(key: key);

  @override
  _ProdukformState createState() => _ProdukformState();
}

class _ProdukformState extends State<Produkform> {
  final _fullnameTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _phonenumberTextboxController = TextEditingController();
  final _IDnumberTextboxController = TextEditingController();
  final _addressTextboxController = TextEditingController();
  DateTime? _selectedDate;
  String? verificationError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Personal'),
        actions: [
          IconButton(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXlaobvxKtT5bj03jC01ceVWElMLa3dhABj2hXyby1bieR0-jmC6treYP9nWXaOx8fwk&usqp=CAU',
            ),
            onPressed: () {
              _saveData();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            _buildTextField(
              labelText: 'Nama Lengkap',
              controller: _fullnameTextboxController,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              labelText: 'Email',
              controller: _emailTextboxController,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              labelText: 'Nomor Telepon',
              controller: _phonenumberTextboxController,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              labelText: 'Nomor Identitas',
              controller: _IDnumberTextboxController,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              labelText: 'Alamat',
              controller: _addressTextboxController,
            ),
            SizedBox(height: 16.0),
            _buildDateSelector(),
            SizedBox(height: 16.0),
            _buildSaveButton(),
            if (verificationError != null)
              Text(
                verificationError!,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }

  Widget _buildDateSelector() {
    return Row(
      children: [
        Text("Tanggal: "),
        ElevatedButton(
          onPressed: () {
            _selectDate(context);
          },
          child: Text(
            _selectedDate != null
                ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                : "Pilih Tanggal",
          ),
        ),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        _saveData();
      },
      child: Text('Simpan'),
    );
  }

  void _saveData() {
    if (isValidPhoneNumber(_phonenumberTextboxController.text)) {
      String fullname = _fullnameTextboxController.text;
      String email = _emailTextboxController.text;
      int nohp = int.tryParse(_phonenumberTextboxController.text) ?? 0;
      int IDnumber = int.tryParse(_IDnumberTextboxController.text) ?? 0;
      String alamat = _addressTextboxController.text;
      String tanggal = _selectedDate != null
          ? "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}"
          : "";

      Map<String, dynamic> data = {
        "fullname": fullname,
        "Email": email,
        "nohp": nohp,
        "ID": IDnumber,
        "alamat": alamat,
        "tanggal": tanggal,
      };

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Produkdetail(
          fullname: fullname,
          Email: email,
          nohp: nohp,
          ID: IDnumber,
          alamat: alamat,
          tanggal: tanggal,
        ),
      ));
    } else {
      setState(() {
        verificationError = "Nomor telepon tidak valid";
      });
    }
  }

  bool isValidPhoneNumber(String phone) {
    return phone.length == 12;
  }
}
