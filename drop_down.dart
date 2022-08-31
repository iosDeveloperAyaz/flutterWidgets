import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../resources/app_colors.dart';





typedef void StringCallback(String val);

class DropDownButtonCase extends StatefulWidget {
  const DropDownButtonCase(
      {Key? key,
        required this.selections,
        required this.callback,
        this.hintText,})
      : super(key: key);

  final List<String> selections;
  final StringCallback callback;
  final String? hintText;

  @override
  State<DropDownButtonCase> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonCase> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  String? _selectedItem;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
        key: _formKey,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextFormField(
    decoration: InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
    ),
    hintText: 'Enter Your Full Name.',
    hintStyle: const TextStyle(fontSize: 14),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    ),
    ),
    const SizedBox(height: 30),
    DropdownButtonFormField2(
    decoration: InputDecoration(
    //Add isDense true and zero Padding.
    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
    isDense: true,
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    //Add more decoration as you want here
    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
    ),
    isExpanded: true,
    hint: const Text(
    'Select Your Gender',
    style: TextStyle(fontSize: 14),
    ),
    icon: const Icon(
    Icons.arrow_drop_down,
    color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 60,
    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    ),
      items: genderItems
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
      },
      onChanged: (value) {
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
    ),

      const SizedBox(height: 30),
      TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: const Text('Submit Button'),
      ),
    ],
    ),
        ),
        ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //      child : Container(
  //           margin: const EdgeInsets.symmetric(vertical: 5.0),
  //           height: 70.0,
  //           width: 500.0,
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //           decoration: BoxDecoration(
  //             color: AppColors.textFieldBackgroundColor,
  //             borderRadius: BorderRadius.circular(12.0),
  //             border: _invalidInput
  //                 ? Border.all(color: AppColors.asteriskColor)
  //                 : const Border(),
  //           ),
  //
  //           child: DropdownButtonHideUnderline(
  //
  //             child: DropdownButton2<String>(
  //               value: _newValue,
  //               validator:
  //
  //               hint: widget.hintText != null
  //                   ? Text(widget.hintText!,
  //                   style: const TextStyle(
  //                       color: AppColors.hintTextColor,
  //                       fontSize: 16.0,
  //                       fontWeight: FontWeight.w400))
  //                   : null,
  //               icon: SvgPicture.asset('assets/icons/drop_down_arrow.svg'),
  //               style: TextStyle(
  //                 color: Theme.of(context).primaryColor,
  //                 fontSize: 16.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //
  //                 onChanged:(String? newValue) {
  //                 debugPrint(newValue);
  //                 setState((){
  //                   _newValue = newValue;
  //
  //                 });
  //
  //                  widget.callback(newValue!);
  //               },
  //
  //               items: widget.selections.map<DropdownMenuItem<String>>((String value) {
  //                 return DropdownMenuItem<String>(
  //                   value: value,
  //                   child: Text(value),
  //
  //
  //                 );
  //               }).toList(),
  //
  //
  //             ),
  //
  //           )
  //
  //           ),
  //
  //
  //   );
  // }
