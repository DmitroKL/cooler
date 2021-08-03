class ContainerMontag{          //ContainerCooler
  final int id;
  final String nazvanRab;
  final String stoimost;
  final int nomerYaCon;

  static final columns = ["id","nazvanRab","stoimost","nomerYaCon"];

  ContainerMontag({
    this.id,
    this.nazvanRab,
    this.stoimost,
    this.nomerYaCon,
  });

  factory  ContainerMontag.fromMap(Map<String, dynamic> data){
    return new  ContainerMontag(
        id: data ['id'],
        nazvanRab: data ['nazvanRab'],
        stoimost: data ['stoimost'],
        nomerYaCon: data ['nomerYaCon']
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "nazvanRab": nazvanRab,
    "stoimost": stoimost,
    "nomerYaCon": nomerYaCon,
  };

}
