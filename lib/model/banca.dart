class Banca {
  String titulo;
  String orientador;
  String dataMarcada;
  String horarioMarcado;
  String curso;
  String membrosBanca;

  Banca({
    this.titulo,
    this.orientador,
    this.dataMarcada,
    this.horarioMarcado,
  });

  Banca.fromJson(Map<String, dynamic> json) {
    titulo = json['name'];
    orientador = json['orientador'];
    dataMarcada = json['presentationDate'];
    horarioMarcado = json['horarioMarcado'];
    curso = json['curso'];
    membrosBanca = json['membrosBanca'];
  }
}


