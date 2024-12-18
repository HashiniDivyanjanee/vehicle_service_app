part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

final class CustomerLoading extends CustomerState {}

final class CustomerLoaded extends CustomerState {
  // final List<Map<String, dynamic>> customers;

  // CustomerLoaded(this.customers);

  // @override
  // List<Object> get props => [customers];

  // final List<String> phones;
  // CustomerLoaded(this.phones);
 final int customerId;
  final String customerName;

  const CustomerLoaded(this.customerId, this.customerName);

  @override
  List<Object> get props => [customerId, customerName];


}


final class CustomerAdded extends CustomerState {}

final class CustomerError extends CustomerState {
  final String error;

  CustomerError(this.error);

  @override
  List<Object> get props => [error];
}
