import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../app/theme.dart';

class PhoneConfirmationScreen extends StatelessWidget {
  const PhoneConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("confirm_phone_number").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
              flex: 2,
            ),
            Text(
              "check_phone",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.green),
            ).tr(),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              "the_code_has_been_sent_to_your_number",
            ).tr(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "07787788048",
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black),
                  child: Text(
                    "edit",
                    style:
                        GoogleFonts.cairo(decoration: TextDecoration.underline),
                  ).tr(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PinFieldAutoFill(
              decoration: BoxLooseDecoration(
                strokeColorBuilder:
                    PinListenColorBuilder(Colors.cyan, Colors.green),
              ),
              onCodeSubmitted: (code) {},
              codeLength: 6,
              onCodeChanged: (code) {
                if (code!.length == 6) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "did_not_receive_your_code",
                  style: TextStyle(fontSize: 16),
                ).tr(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppTheme.orange),
                  child: Text(
                    "resend",
                    style: GoogleFonts.cairo(),
                  ).tr(),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
