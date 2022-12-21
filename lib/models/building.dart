class Building {
  String? name;
  String? company;
  String? code;

  Building({
    required this.name,
    required this.company,
    required this.code,
  });
}

Building createBuilding(String buildingName, String generatedCode, String company) {
  return Building(name: buildingName, code: generatedCode, company: company);
}