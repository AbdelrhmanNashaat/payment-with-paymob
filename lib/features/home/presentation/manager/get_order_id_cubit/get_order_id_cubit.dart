import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/secret_data.dart';
import 'package:payment/features/home/data/models/order_data_model/shipping_data.dart';
import 'package:payment/features/home/data/repo/home_repo.dart';
import '../../../data/models/order_data_model/item.dart';
import 'get_order_id_state.dart';

class GetOrderIdCubit extends Cubit<GetOrderIdState> {
  final HomeRepo homeRepo;
  GetOrderIdCubit({required this.homeRepo}) : super(GetOrderIdInitial());
  int totalAmountInCents = 0;
  final List<Item> items = [
    Item(
      name: 'Polo Shirt for men',
      amountCents: '65000',
      quantity: '1',
      description: 'mens polo shirt',
    ),
    Item(
      name: 'Scott Bag',
      amountCents: '30000',
      quantity: '1',
      description: 'back bag',
    ),
    Item(
      name: 'Pro Tour Shoes',
      amountCents: '80000',
      quantity: '1',
      description: 'running shoes',
    ),
    Item(
      name: 'T250 Headphones',
      amountCents: '45000',
      quantity: '1',
      description: 'headphones',
    ),
  ];

  ShippingData shippingData = ShippingData(
    apartment: "Apt 12B",
    email: "Abdelrhman.nashaat@gmail.com",
    floor: "2nd",
    firstName: "Abdelrhman",
    street: "123 Main St",
    building: "Building 1",
    phoneNumber: "+1234567890",
    postalCode: "12345",
    extraDescription: "Near the park",
    city: "Cairo",
    country: "Egypt",
    lastName: "Doe",
    state: "Cairo",
  );
  Future<void> getOrderId({required String authToken}) async {
    for (var item in items) {
      totalAmountInCents +=
          int.parse(item.amountCents!) * int.parse(item.quantity!);
    }
    emit(GetOrderIdLoading());
    final orderId = await homeRepo.getOrderId(
      authToken: authToken,
      deliveryNeeded: "false",
      amountCents: '$totalAmountInCents',
      items: items,
      shippingData: shippingData,
    );

    orderId.fold((l) => emit(GetOrderIdFailure(errorMessage: l.message)), (r) {
      SecretData.amountCent = totalAmountInCents.toString();
      emit(GetOrderIdSuccess(orderId: r));
    });
  }
}
