class DomainLayerExption implements Exception {
  String cause;
  DomainLayerExption(this.cause);

  @override
  String toString(){
    return cause;
  }

}