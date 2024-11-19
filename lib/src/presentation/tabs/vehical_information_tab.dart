import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/presentation/widgets/drop_down_menu_widget.dart';
import 'package:vehicle_service_app/src/presentation/widgets/select_date_field.dart';
import 'package:vehicle_service_app/src/presentation/widgets/text_form_field.dart';

class VehicalInformation extends StatelessWidget {
  VehicalInformation({super.key});
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
            const  Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "VEHICLE INFORMATION",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            const  Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Enter Vehicle Details",
                    style: TextStyle(
                        color: AppThemes.SecondTextColor,
                        fontSize: AppThemes.SecondaryFontSize),
                  ),
                ),
              ),
             const SizedBox(
                height: 40,
              ),
              DropDownMenuWidget(),
              SelectDateField(),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Vehicle Number",
                suffixIcon: Icons.numbers,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
             const SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Current Mileage",
                suffixIcon: Icons.height,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
             const SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Brand",
                suffixIcon: Icons.badge_rounded,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
             const SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Model",
                suffixIcon: Icons.model_training,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
             const SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Year",
                suffixIcon: Icons.date_range,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
             const SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Color",
                suffixIcon: Icons.color_lens,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}