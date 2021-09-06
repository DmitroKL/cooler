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

  factory ContainerCooler.fromMap(Map<String, dynamic> data){
    return new ContainerCooler(
        id: data ['id'],
        conNomer: data ['conNomer'],
        nameCon: data ['nameCon'],
        nomerYaCon: data ['nomerYaCon'],
        cvet: data ['cvet']
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "conNomer": conNomer,
    "nameCon": nameCon,
    "nomerYaCon": nomerYaCon,
    "cvet": cvet,
  };

}
