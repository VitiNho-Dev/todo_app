abstract class Failures {}

class NoInternetConnection extends Failures {
  final String message;

  NoInternetConnection(this.message);
}

class NoDataFound extends Failures {}

class InvalidError extends Failures {}
