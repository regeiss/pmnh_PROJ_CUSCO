class PetSubmitException {
  String get title => 'Nome já é usado';
  String get description => 'Informe outro nome para o pet';

  @override
  String toString() {
    return '$title. $description.';
  }
}
