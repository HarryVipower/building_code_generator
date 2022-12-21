class Building {
  String? name;
  String? code;

  Building({
    required this.name,
    required this.code,
  });
}

Building createBuilding(String buildingName, String generatedCode) {
  return Building(name: buildingName, code: generatedCode);
}