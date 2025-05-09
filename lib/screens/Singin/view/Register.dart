import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vogo/screens/Singin/view/Bynumber.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 60.h),
              Center(
                child: Image.asset(
                  'assets/Images/Mask Group.png', // Replace with your image path
                  height: 300.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Obtine tot ce ai nevoie.\nOricand. Oriunde.\nServicii premium.',
                style: GoogleFonts.abel(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => NumberInputScreen(),
                    ),
                  );
                },
                child: PhoneNumberSection(),
              ),

              Divider(thickness: 1),

              Center(
                child: Text(
                  'Sau conectare cu social media / email',
                  style: GoogleFonts.abel(fontSize: 14.sp, color: Colors.grey),
                ),
              ),

              SizedBox(height: 20.h),
              Container(
                height: 67.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 83, 131, 236),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 24.h,
                      width: 24.w,
                      child: Image.asset('assets/Images/icons8-google-480.png'),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.abel(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // // Google Button
              // _buildSocialButton(
              //   icon: Icons.google,
              //   label: 'Continue with Google',
              //   color: const Color(0xFF4285F4),
              // ),
              SizedBox(height: 16.h),
              Container(
                height: 67.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 74, 102, 172),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 24.h,
                      width: 24.w,
                      child: Image.asset(
                        'assets/Images/icons8-facebook-480.png',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Continue with Facebook",
                      style: GoogleFonts.abel(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // // Facebook Button
              // _buildSocialButton(
              //   icon: Icons.facebook,
              //   label: 'Continue with Facebook',
              //   color: const Color(0xFF3b5998),
              // ),
              SizedBox(height: 16.h),
              Container(
                height: 67.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 83, 117, 117),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Image.asset('assets/Images/icons8-gmail-480.png'),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Continue with mail",
                      style: GoogleFonts.abel(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // // Email Button
              // _buildSocialButton(
              //   icon: Icons.email_outlined,
              //   label: 'Continue with Email',
              //   color: const Color(0xFF34A853),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24.sp),
        label: Text(label, style: TextStyle(fontSize: 16.sp)),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberSection extends StatefulWidget {
  @override
  _PhoneNumberSectionState createState() => _PhoneNumberSectionState();
}

class _PhoneNumberSectionState extends State<PhoneNumberSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IgnorePointer(
              ignoring: true,
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                // textFieldController: controller,
                formatInput: true,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputDecoration: InputDecoration(
                  border: InputBorder.none, // Removes default border
                  enabledBorder: InputBorder.none, // Removes enabled border
                  focusedBorder: InputBorder.none, // Removes focus border
                  errorBorder: InputBorder.none, // Removes error border
                  disabledBorder: InputBorder.none, // Removes disabled border
                  contentPadding:
                      EdgeInsets.zero, // Optional: remove internal padding
                  isDense: true, // Makes the field compact
                ),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(
      phoneNumber,
      'US',
    );

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
