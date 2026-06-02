// import 'package:flutter/material.dart';

// class FormTemplate extends StatefulWidget {
//   const FormTemplate({super.key, required this.typeForm});

//   final String typeForm;

//   @override
//   State<FormTemplate> createState() => _FormTemplateState();
// }

// class _FormTemplateState extends State<FormTemplate> {
//   bool passVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: widget.typeForm == "Email"
//           ? TextInputType.emailAddress
//           : null,

//       obscureText: widget.typeForm == "Password" ? !passVisible : false,
//       obscuringCharacter: "*",

//       decoration: InputDecoration(
//         hintText: "Enter your ${widget.typeForm.toLowerCase()}",
//         hintStyle: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Color(0xFFC1C6D6)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Color(0xFFC1C6D6)),
//         ),

//         filled: true,
//         fillColor: Colors.white,

//         suffixIcon: widget.typeForm == "Password"
//             ? IconButton(
//                 onPressed: () {
//                   setState(() {
//                     passVisible = !passVisible;
//                   });
//                 },

//                 icon: Icon(
//                   passVisible
//                       ? Icons.visibility_outlined
//                       : Icons.visibility_off_outlined,

//                   color: const Color(0xFF727785),
//                 ),
//               )
//             : null,

//         prefixIcon: widget.typeForm.isEmpty
//             ? null
//             : (Icon(
//                 iconForm(widget.typeForm.toLowerCase()),
//                 color: Color(0xFF727785),
//               )),

//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.red, width: 1.5),
//         ),

//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Color(0xFFC1C6D6)),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "${widget.typeForm} is required";
//         }

//         if (widget.typeForm == "Password") {
//           if (value.length < 8) {
//             return "Password less than 8 characters";
//           }
//         } else if (widget.typeForm == "Email") {
//           if (!value.contains("@")) {
//             return "Incorrect email format";
//           }
//         }
//         return null;
//       },
//     );
//   }
// }

// IconData iconForm(String namaIcon) {
//   switch (namaIcon) {
//     case "name":
//       return Icons.person;
//     case "full name":
//       return Icons.person;
//     case "email":
//       return Icons.mail_outline;
//     case "phone":
//       return Icons.phone;
//     case "password":
//       return Icons.lock_outline;
//     case "confirm password":
//       return Icons.lock_outline;
//     case "location":
//       return Icons.location_on;
//     default:
//       return Icons.keyboard;
//   }
// }
