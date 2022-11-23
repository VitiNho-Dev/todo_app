abstract class Failures {
  final String message;
  final StackTrace? stackTrace;

  const Failures({
    this.message = '',
    this.stackTrace,
  });
}

class NoInternetConnection extends Failures {
  const NoInternetConnection({super.message, super.stackTrace});
}

class NoDataFound extends Failures {
  const NoDataFound({super.message, super.stackTrace});
}

class InvalidData extends Failures {
  const InvalidData({super.message, super.stackTrace});
}
