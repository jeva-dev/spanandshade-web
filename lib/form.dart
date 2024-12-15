import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:spanandshade/contact.dart';

class BookDemoForm extends StatefulWidget {
  const BookDemoForm({super.key});

  @override
  State<BookDemoForm> createState() => _FormState();
}

class _FormState extends State<BookDemoForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController name = TextEditingController();
  TextEditingController custEmail = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController contactnum = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController planning = TextEditingController();
  TextEditingController typeOfBuilding = TextEditingController();

  //
  sendMail(
      String name,
      String brand,
      String custEmail,
      String contactnum,
      String area,
      String location,
      String planning,
      String typeOfBuilding) async {
    final Email email = Email(
        body:
            """Name : $name,Email : $custEmail, \n Brand: $brand,\nContact Number : $contactnum,\nArea : $area,\n Site Location : $location, Planning in months : $planning,\n Type of Building : $typeOfBuilding""",
        recipients: ["principalengineer@spanandshade.com"],
        subject: "Demo Customer : $name",
        isHTML: false);
    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form sent successfully!')));
    } catch (e) {
      print("Error : " + e.toString());
    }
  }

  // Function to send form data via email
  // void sendEmail(String formData) async {
  //   final Email email = Email(
  //     body: formData,
  //     subject: 'Form Submission Details',
  //     recipients: ['principalengineer@spanandshade.com'],
  //     isHTML: false,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Form sent successfully!')));
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Failed to send form: $e')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "s&s.png",
                    height: 150,
                    width: 300,
                  ),
                  const Text(
                    "Book for Demo",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Copperplate_Gothic_Bold',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name field with validation
                            FormBuilderTextField(
                              name: 'name',
                              controller: name,
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Name is required'),
                                FormBuilderValidators.minLength(3,
                                    errorText:
                                        'Name must be at least 3 characters'),
                              ]),
                            ),
                            FormBuilderTextField(
                              name: 'email',
                              controller: custEmail,
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Email is required'),
                                FormBuilderValidators.minLength(3,
                                    errorText:
                                        'Email must be at least 3 characters'),
                              ]),
                            ),

                            // Brand Name field with validation
                            FormBuilderTextField(
                              name: 'brand_name',
                              controller: brand,
                              decoration: const InputDecoration(
                                  labelText: 'Brand Name'),
                              validator: FormBuilderValidators.required(
                                  errorText: 'Brand Name is required'),
                            ),
                            const SizedBox(height: 10),

                            // Contact Number field with validation
                            FormBuilderTextField(
                              name: 'contact_number',
                              controller: contactnum,
                              decoration: const InputDecoration(
                                  labelText: 'Contact Number'),
                              keyboardType: TextInputType.phone,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Contact Number is required'),
                                FormBuilderValidators.numeric(
                                    errorText:
                                        'Contact number must be numeric'),
                                FormBuilderValidators.minLength(10,
                                    errorText:
                                        'Contact number must be at least 10 digits'),
                                FormBuilderValidators.maxLength(10,
                                    errorText:
                                        'Contact number must be 10 digits'),
                              ]),
                            ),
                            const SizedBox(height: 10),

                            // Area in SqFt field with validation
                            FormBuilderTextField(
                              name: 'area_sqft',
                              controller: area,
                              decoration: const InputDecoration(
                                  labelText: 'Area (sqft)'),
                              keyboardType: TextInputType.number,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Area is required'),
                                FormBuilderValidators.numeric(
                                    errorText: 'Area must be numeric'),
                                FormBuilderValidators.min(1,
                                    errorText: 'Area must be greater than 0'),
                              ]),
                            ),
                            const SizedBox(height: 10),

                            // Site Location field with validation
                            FormBuilderTextField(
                              name: 'site_location',
                              controller: location,
                              decoration: const InputDecoration(
                                  labelText: 'Site Location'),
                              validator: FormBuilderValidators.required(
                                  errorText: 'Site Location is required'),
                            ),
                            const SizedBox(height: 10),

                            // Venue of Planning (Months) field with validation
                            FormBuilderTextField(
                              name: 'venue_planning_months',
                              controller: planning,
                              decoration: const InputDecoration(
                                  labelText: 'Venue Planning (Months)'),
                              keyboardType: TextInputType.number,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText:
                                        'Venue Planning (Months) is required'),
                                FormBuilderValidators.numeric(
                                    errorText: 'Must be a number'),
                                FormBuilderValidators.min(1,
                                    errorText: 'Must be at least 1 month'),
                              ]),
                            ),
                            const SizedBox(height: 10),

                            // Residential or Commercial dropdown with validation
                            FormBuilderTextField(
                              name: 'Type of Building',
                              controller: typeOfBuilding,
                              decoration: const InputDecoration(
                                  labelText:
                                      'Residential, Commercial, Hospital, Corporate, Stores'),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Store is required'),
                                FormBuilderValidators.minLength(3,
                                    errorText:
                                        'Store must be at least 3 characters'),
                              ]),
                            ),
                            const SizedBox(height: 20),

                            // Submit Button
                            ElevatedButton(
                              onPressed: () {
                                _formKey.currentState!.save();
                                sendMail(
                                    name.text,
                                    brand.text,
                                    custEmail.text,
                                    contactnum.text,
                                    area.text,
                                    location.text,
                                    planning.text,
                                    typeOfBuilding.text);
                              },
                              child: const Text('Send Form'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
