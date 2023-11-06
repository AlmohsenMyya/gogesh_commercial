import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../app/theme.dart';
import '../../widgets/costume_button.dart';

class AddSubscription extends HookWidget {
  AddSubscription({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameholder = useTextEditingController();
    final numbercard = MaskedTextController(mask: "0000 0000 0000 0000");
    final expireDate = MaskedTextController(mask: "00/00");
    final cvc = MaskedTextController(mask: "000");
    bool condition = false;
    Widget? icon;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscriptions").tr(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return TextfFeldwidgetSubs(
                      label: "card number".tr(),
                      hint: "card number".tr(),
                      controller: numbercard,
                      maxLengh: 19,
                      icon: icon,
                      inputType: TextInputType.number,
                      onChanged: (value) {
                        setState(
                          () {
                            var types = detectCCType(numbercard.text);

                            switch (types.first.type) {
                              case "visa":
                                icon = const Icon(
                                  FontAwesomeIcons.ccVisa,
                                  size: 20,
                                  //color: Colors.black,
                                );
                                break;

                              case "maestro":
                                icon = const Icon(
                                  FontAwesomeIcons.ccAmex,
                                  size: 20,
                                  color: Color(0xffffffff),
                                );
                                break;
                              case "mastercard":
                                icon = const Icon(
                                  FontAwesomeIcons.ccMastercard,
                                  size: 20,
                                  color: Colors.redAccent,
                                );
                                break;

                              case "discover":
                                icon = const Icon(
                                  FontAwesomeIcons.ccDiscover,
                                  size: 20,
                                  color: Color(0xffffffff),
                                );
                                break;

                              case "jcb":
                                icon = const Icon(
                                  FontAwesomeIcons.ccJcb,
                                  size: 20,
                                  color: Color(0xffffffff),
                                );
                                break;

                              default:
                                icon = Container(
                                  color: Color(0x00000000),
                                );
                            }
                          },
                        );
                      },
                    );
                  }),
                  TextfFeldwidgetSubs(
                    label: "The name of the card holder".tr(),
                    hint: "The name of the card holder".tr(),
                    controller: nameholder,
                    onChanged: (value) {},
                  ),
                  TextfFeldwidgetSubs(
                    label: "Expiry date".tr(),
                    hint: "Expiry date".tr(),
                    controller: expireDate,
                    inputType: TextInputType.number,
                    maxLengh: 5,
                    onChanged: (value) {},
                  ),
                  TextfFeldwidgetSubs(
                    label: "Security_code".tr(),
                    hint: "Security_code".tr(),
                    inputType: TextInputType.number,
                    controller: cvc,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                          builder: (context, setState) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (condition) {
                                      condition = false;
                                    } else {
                                      condition = true;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 3.h,
                                  width: 3.h,
                                  decoration: BoxDecoration(
                                      color: condition
                                          ? Colors.black
                                          : Colors.white,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.check,
                                    color: condition
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              )),
                      SizedBox(
                        width: 2.h,
                      ),
                      const Text("Use the card as default").tr()
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 6.h,
                    width: double.infinity,
                    child: custombuttom(
                        color: AppTheme.secondaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            CreditCardValidator _ccValidator =
                                CreditCardValidator();

                            CCNumValidationResults ccNumResults =
                                _ccValidator.validateCCNum(numbercard.text);
                            ValidationResults expDateResults =
                                _ccValidator.validateExpDate(expireDate.text);
                            ValidationResults cvvResults = _ccValidator
                                .validateCVV(cvc.text, ccNumResults.ccType);

                            if (ccNumResults.isPotentiallyValid) {
                              print('valide');
                            }
                          }
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ).tr()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextfFeldwidgetSubs extends StatelessWidget {
  const TextfFeldwidgetSubs(
      {super.key,
      this.maxLengh,
      required this.hint,
      required this.controller,
      this.onChanged,
      this.validator,
      this.inputType,
      this.icon,
      required this.label});
  final String hint;
  final String label;
  final int? maxLengh;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          style: const TextStyle(height: 1.5),
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 14.sp,
            ),
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: const BorderSide(width: 0, color: AppTheme.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: const BorderSide(width: 0, color: AppTheme.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.h),
              borderSide: const BorderSide(width: 0, color: AppTheme.green),
            ),
          ),
          controller: controller,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
