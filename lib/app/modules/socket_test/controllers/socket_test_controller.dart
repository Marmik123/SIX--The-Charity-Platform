import 'package:get/get.dart';
import 'package:get_x_starter_kit/app/data/config/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketTestController extends GetxController {
  final RxString socketStatus = 'disconnected'.obs;

  // late GetSocket socket;

  late IO.Socket socket;

  Future<void> connectToSocket() async {
    socket = IO.io(
      'https://trainovate.api.dharmatech.in/',
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          <String, dynamic>{'auth': 'yash'}).build(),
    );
    socket.connect();
    socket.onConnect((dynamic data) {
      socketStatus('connected');
      startListening();
    });
    socket.onDisconnect((dynamic data) {
      socketStatus('socket closed');
    });

    socket.onError((dynamic e) {
      logWTF(e);
    });
  }

  void startListening() {
    socket.on('new-socketid', (dynamic val) {
      logI(val);
    });

    socket.on('connect_error', (dynamic val) {
      logWTF(val);
    });
  }
}
