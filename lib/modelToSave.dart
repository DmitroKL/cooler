import 'dart:convert';
/*
ContainerCooler ContainerCoolerFromJson(String str) {
  final jsonData = json.decode(str);
  return ContainerCooler.fromMap(jsonData);
}

String ContainerCoolerToJson(ContainerCooler data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

json+++
 */

class ContainerCooler{
  final int id;
  final String conNomer;
  final String nameCon;
  final int nomerYaCon;
  final String cvet;

  static final columns = ["id","conNomer","nameCon","nomerYaCon","cvet"];

  ContainerCooler({
    this.id,
    this.conNomer,
    this.nameCon,
    this.nomerYaCon,
    this.cvet,
  });
  /*
  ContainerCooler({
    this.id,
    this.conNomer,
    this.nameCon,
    this.nomerYaCon,
  });

json+++
   */
  factory ContainerCooler.fromMap(Map<String, dynamic> data){
    return new ContainerCooler(
       id: data ['id'],
        conNomer: data ['conNomer'],
        nameCon: data ['nameCon'],
        nomerYaCon: data ['nomerYaCon'],
        cvet: data ['cvet']
    );
  }


  /*
  factory ContainerCooler.fromMap(Map<String, dynamic> json) => new ContainerCooler(
    id: json["id"],
    conNomer: json["conNomer"],
    nameCon: json["nameCon"],
    nomerYaCon: json["nomerYaCon"] ,
  );

json+++
   */

  Map<String, dynamic> toMap() => {
      "id": id,
      "conNomer": conNomer,
      "nameCon": nameCon,
      "nomerYaCon": nomerYaCon,
      "cvet": cvet,
  };

}
