import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/customer/customer_bloc.dart';


class VehicalInformation extends StatefulWidget {
  const VehicalInformation({Key? key}) : super(key: key);

  @override
  State<VehicalInformation> createState() => _VehicalInformationState();
}

class _VehicalInformationState extends State<VehicalInformation> {
  @override
  Widget build(BuildContext context) {
    final customerPhoneController = TextEditingController();
    final customerNameController = TextEditingController();
    final customerIdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Job Card Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: customerPhoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final phone = customerPhoneController.text.trim();
                if (phone.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a phone number')),
                  );
                  return;
                }
                context
                    .read<CustomerBloc>()
                    .add(fetchCustomerDetailsByPhone(phone));
              },
              child: const Text('Find Customer'),
            ),
            const SizedBox(height: 16),
            BlocListener<CustomerBloc, CustomerState>(
              listener: (context, state) {
                if (state is CustomerLoaded) {
                  customerIdController.text = state.customerId.toString();
                  customerNameController.text = state.customerName;
                } else if (state is CustomerError) {
                  customerIdController.clear();
                  customerNameController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CustomerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      TextField(
                        controller: customerIdController,
                        decoration: const InputDecoration(
                          labelText: 'Customer ID',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: customerNameController,
                        decoration: const InputDecoration(
                          labelText: 'Customer Name',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
