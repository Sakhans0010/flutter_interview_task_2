import '../Services/Api Services/app_exceptions.dart';
import 'dialog_boxes.dart';

class HandlingErrors {
  void handleError(error) {
    DialogBoxes.hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogBoxes.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogBoxes.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      DialogBoxes.showErroDialog(
          description: 'Oops! It took longer to respond.');
    }
  }
}
