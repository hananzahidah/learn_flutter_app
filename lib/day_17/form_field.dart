import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_17/icon_form.dart';

class FormFieldTemplate extends StatefulWidget {
  const FormFieldTemplate({
    super.key,
    required this.typeForm,
    required this.controllerType,
  });

  final TextEditingController controllerType;
  final String typeForm;

  @override
  State<FormFieldTemplate> createState() => _FormFieldTemplateState();
}

class _FormFieldTemplateState extends State<FormFieldTemplate> {
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerType,
      keyboardType: widget.typeForm == "Email"
          ? TextInputType.emailAddress
          : widget.typeForm == "Phone"
          ? TextInputType.phone
          : null,

      obscureText: widget.typeForm == "Password" ? !passVisible : false,
      obscuringCharacter: "*",

      decoration: InputDecoration(
        hintText: "Enter your ${widget.typeForm.toLowerCase()}",
        hintStyle: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),

        filled: true,
        fillColor: Colors.white,

        suffixIcon: widget.typeForm == "Password"
            ? IconButton(
                onPressed: () {
                  setState(() {
                    passVisible = !passVisible;
                  });
                },

                icon: Icon(
                  passVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,

                  color: const Color(0xFF727785),
                ),
              )
            : null,

        prefixIcon: widget.typeForm.isEmpty
            ? null
            : (Icon(
                iconForm(widget.typeForm.toLowerCase()),
                color: Color(0xFF727785),
              )),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),
      ),
      validator: (value) {
        if (widget.typeForm == "Phone") {
          if (value == null || value.isEmpty) {
            return null;
          }

          if (value.length < 11 || value.length > 13) {
            return "Phone must have 11-13 characters";
          }
        } else {
          if (value == null || value.isEmpty) {
            return "${widget.typeForm} is required";
          }

          if (widget.typeForm == "Password") {
            if (value.length < 8) {
              return "Password less than 8 characters";
            }
          } else if (widget.typeForm == "Email") {
            if (!value.contains("@")) {
              return "Incorrect email format";
            }
          } else if (widget.typeForm == "Role") {
            final role = value.toLowerCase().trim();

            if (role != "general" && role != "volunteer") {
              return "Role must be general or volunteer";
            }
          }
        }

        return null;
      },
    );
  }
}
