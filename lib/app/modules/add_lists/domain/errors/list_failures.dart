abstract class Failures {}

class NoInternetConnection extends Failures {
  final String message;

  NoInternetConnection(this.message);
}

class DatasourceError extends Failures {
  final String message;

  DatasourceError(this.message);
}
