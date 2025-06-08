import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addAdressModel.dart';

class BillingFormScreen extends StatefulWidget {
  const BillingFormScreen({super.key});

  @override
  State<BillingFormScreen> createState() => _BillingFormScreenState();
}

class _BillingFormScreenState extends State<BillingFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers with pre-filled values
  final _firstNameController = TextEditingController(text: "John");
  final _lastNameController = TextEditingController(text: "Doe");
  final _companyController = TextEditingController(text: "Acme Corp");
  final _address1Controller = TextEditingController(text: "123 Main St");
  final _address2Controller = TextEditingController(text: "Apt 456");
  final _cityController = TextEditingController(text: "New York");
  final _stateController = TextEditingController(text: "NY");
  final _stateNameController = TextEditingController(text: "New York");
  final _postcodeController = TextEditingController(text: "10001");
  final _countryController = TextEditingController(text: "US");
  final _countryNameController = TextEditingController(text: "United States");
  final _phoneController = TextEditingController(text: "1234567890");
  final _emailController = TextEditingController(text: "john@example.com");
  final _dialCodeController = TextEditingController(text: "+1");
  

  bool _sameAsBilling = true;
  var btnloader = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData()async {
     final box = await Hive.openBox('userdata');
    final email = box.get('email');
    final name = box.get("name");
    setState(() {
      _emailController.text = email;
      _firstNameController.text = name;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Edit Billing Address', style: GoogleFonts.abel(fontSize: 22.sp)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(_firstNameController, "First Name"),
              buildTextField(_lastNameController, "Last Name"),
              buildTextField(_companyController, "Company"),
              buildTextField(_address1Controller, "Address Line 1"),
              buildTextField(_address2Controller, "Address Line 2"),
              buildTextField(_cityController, "City"),
              buildTextField(_stateController, "State Code (e.g. NY)"),
              buildTextField(_stateNameController, "State Name"),
              buildTextField(_postcodeController, "Postcode"),
              buildTextField(_countryController, "Country Code (e.g. US)"),
              buildTextField(_countryNameController, "Country Name"),
              buildTextField(_dialCodeController, "Dial Code"),
              buildTextField(_phoneController, "Phone"),
              buildTextField(
                _emailController,
                "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: _sameAsBilling,
                    onChanged: (value) {
                      setState(() {
                        _sameAsBilling = value ?? false;
                      });
                    },
                  ),
                  const Text("Same as Billing"),
                ],
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    // You can handle the form submission here
                    setState(() {
                      btnloader = true;
                    });
                    final box = await Hive.openBox('userdata');
                    final userId = box.get('@id');
                    final service = APIStateNetwork(await createDio());
                    final response = await service.addAdress(
                      AddressAddModel(
                        accessToken: userId,
                        addressType: "billing",
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        company: _companyController.text,
                        address1: _address1Controller.text,
                        address2: _address2Controller.text,
                        city: _cityController.text,
                        state: _stateController.text,
                        stateName: _stateNameController.text,
                        postcode: _postcodeController.text,
                        country: _countryController.text,
                        countryName: _countryNameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        dialCode: _dialCodeController.text,
                        sameAsBilling: _sameAsBilling,
                      ),
                    );
                    if (response.response.data["code"] == 200) {
                      Fluttertoast.showToast(
                        msg: "Address Added",
                        backgroundColor: Colors.green,
                      );
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                        msg: "${response.response.data["message"]}",
                        backgroundColor: Colors.red,
                      );
                      setState(() {
                        btnloader = false;
                      });
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child:
                        btnloader == false
                            ? Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 0.8,
                              ),
                            )
                            : CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator:
            (value) => value == null || value.isEmpty ? "Required field" : null,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
