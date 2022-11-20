class Ciotsresult {
  bool? sucesso;
  String? mensagem;
  List<Ciots>? ciots;

  Ciotsresult({this.sucesso, this.mensagem, this.ciots});

  Ciotsresult.fromJson(Map<String, dynamic> json) {
    sucesso = json['Sucesso'];
    mensagem = json['Mensagem'];
    if (json['Ciots'] != null) {
      ciots = <Ciots>[];
      json['Ciots'].forEach((v) {
        ciots!.add(new Ciots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sucesso'] = this.sucesso;
    data['Mensagem'] = this.mensagem;
    if (this.ciots != null) {
      data['Ciots'] = this.ciots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ciots {
  int? id;
  String? cpfCnpjContratado;
  String? rNTRCContratado;
  String? veiculos;
  String? cpfCnpjContratante;
  String? cpfCnpjDestinatario;
  String? codigoMunicipioOrigem;
  String? codigoMunicipioDestino;
  String? codigoNaturezaCarga;
  int? pesoCarga;
  String? dataInicioViagem;
  String? dataFimViagem;
  String? tipoViagem;
  Null? rNTRCContratante;
  int? valorTarifas;
  int? quantidadeTarifas;
  String? codigoIdentificacaoOperacao;
  String? dataDeclaracaoTransporte;
  String? flagContingencia;
  String? flagCliente;
  String? codigoVerificador;
  String? protocolo;
  Null? protocoloCancelamento;
  Null? dataCancelamento;
  Null? protocoloEncerramento;
  Null? dataEncerramento;
  String? status;
  String? createdAt;
  String? cte;
  int? valorFreteTotal;
  int? iRRF;
  int? iNSS;
  int? sESTSENAT;
  int? outros;
  int? pedagio;
  Null? valorFretePorUnidade;
  Null? pesoCargaEntregue;
  Null? dataEntrega;
  Null? outrosDescricao;
  String? statusQuitacao;
  Null? cnpjQuitador;
  String? criterioAceite;
  Null? codigoInterno;
  int? valorMercadoriaTotal;
  Null? valorMercadoriaUnidade;
  Null? dataQuitacao;
  String? diferencaFrete;
  int? diferencaFreteTolerancia;
  String? tipoDeQuebra;
  int? limiteMinQuebra;
  int? limiteMaxQuebra;
  String? pagarMotorista;
  String? cpfCnpjMotorista;
  int? cartaFrete;
  int? pagtoContaDigital;
  Null? descricaoFilial;
  Null? motivoPesoEntrega;
  Null? dataAlteracaoPesoEntrega;
  Null? pesoCargaOriginal;
  Null? nomeRemetente;
  Null? nomeDestinatario;
  Null? nomeMotorista;
  Null? nomeContratado;
  Null? observacoes;
  Null? pesoEntregaOriginal;
  Null? valoresAdicionais;
  Null? totalDeDiferencaFrete;
  Null? totalDeQuebra;
  Null? seguradoNome;
  Null? seguradoCPF;
  Null? seguradoSexo;
  Null? seguradoDataNascimento;
  Null? protocoloContingenciado;
  Null? dataContingenciado;
  Null? codigoVerificadorContingenciado;
  int? isPlatform;
  String? descricaoNaturezaCarga;
  List<Null>? parcelas;
  List<Null>? retificacoes;

  Ciots(
      {this.id,
        this.cpfCnpjContratado,
        this.rNTRCContratado,
        this.veiculos,
        this.cpfCnpjContratante,
        this.cpfCnpjDestinatario,
        this.codigoMunicipioOrigem,
        this.codigoMunicipioDestino,
        this.codigoNaturezaCarga,
        this.pesoCarga,
        this.dataInicioViagem,
        this.dataFimViagem,
        this.tipoViagem,
        this.rNTRCContratante,
        this.valorTarifas,
        this.quantidadeTarifas,
        this.codigoIdentificacaoOperacao,
        this.dataDeclaracaoTransporte,
        this.flagContingencia,
        this.flagCliente,
        this.codigoVerificador,
        this.protocolo,
        this.protocoloCancelamento,
        this.dataCancelamento,
        this.protocoloEncerramento,
        this.dataEncerramento,
        this.status,
        this.createdAt,
        this.cte,
        this.valorFreteTotal,
        this.iRRF,
        this.iNSS,
        this.sESTSENAT,
        this.outros,
        this.pedagio,
        this.valorFretePorUnidade,
        this.pesoCargaEntregue,
        this.dataEntrega,
        this.outrosDescricao,
        this.statusQuitacao,
        this.cnpjQuitador,
        this.criterioAceite,
        this.codigoInterno,
        this.valorMercadoriaTotal,
        this.valorMercadoriaUnidade,
        this.dataQuitacao,
        this.diferencaFrete,
        this.diferencaFreteTolerancia,
        this.tipoDeQuebra,
        this.limiteMinQuebra,
        this.limiteMaxQuebra,
        this.pagarMotorista,
        this.cpfCnpjMotorista,
        this.cartaFrete,
        this.pagtoContaDigital,
        this.descricaoFilial,
        this.motivoPesoEntrega,
        this.dataAlteracaoPesoEntrega,
        this.pesoCargaOriginal,
        this.nomeRemetente,
        this.nomeDestinatario,
        this.nomeMotorista,
        this.nomeContratado,
        this.observacoes,
        this.pesoEntregaOriginal,
        this.valoresAdicionais,
        this.totalDeDiferencaFrete,
        this.totalDeQuebra,
        this.seguradoNome,
        this.seguradoCPF,
        this.seguradoSexo,
        this.seguradoDataNascimento,
        this.protocoloContingenciado,
        this.dataContingenciado,
        this.codigoVerificadorContingenciado,
        this.isPlatform,
        this.descricaoNaturezaCarga,
        this.parcelas,
        this.retificacoes});

  Ciots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpfCnpjContratado = json['CpfCnpjContratado'];
    rNTRCContratado = json['RNTRCContratado'];
    veiculos = json['Veiculos'];
    cpfCnpjContratante = json['CpfCnpjContratante'];
    cpfCnpjDestinatario = json['CpfCnpjDestinatario'];
    codigoMunicipioOrigem = json['CodigoMunicipioOrigem'];
    codigoMunicipioDestino = json['CodigoMunicipioDestino'];
    codigoNaturezaCarga = json['CodigoNaturezaCarga'];
    pesoCarga = json['PesoCarga'];
    dataInicioViagem = json['DataInicioViagem'];
    dataFimViagem = json['DataFimViagem'];
    tipoViagem = json['TipoViagem'];
    rNTRCContratante = json['RNTRCContratante'];
    valorTarifas = json['ValorTarifas'];
    quantidadeTarifas = json['QuantidadeTarifas'];
    codigoIdentificacaoOperacao = json['CodigoIdentificacaoOperacao'];
    dataDeclaracaoTransporte = json['DataDeclaracaoTransporte'];
    flagContingencia = json['FlagContingencia'];
    flagCliente = json['FlagCliente'];
    codigoVerificador = json['CodigoVerificador'];
    protocolo = json['Protocolo'];
    protocoloCancelamento = json['ProtocoloCancelamento'];
    dataCancelamento = json['DataCancelamento'];
    protocoloEncerramento = json['ProtocoloEncerramento'];
    dataEncerramento = json['DataEncerramento'];
    status = json['status'];
    createdAt = json['created_at'];
    cte = json['cte'];
    valorFreteTotal = json['ValorFreteTotal'];
    iRRF = json['IRRF'];
    iNSS = json['INSS'];
    sESTSENAT = json['SEST_SENAT'];
    outros = json['Outros'];
    pedagio = json['Pedagio'];
    valorFretePorUnidade = json['ValorFretePorUnidade'];
    pesoCargaEntregue = json['PesoCargaEntregue'];
    dataEntrega = json['DataEntrega'];
    outrosDescricao = json['OutrosDescricao'];
    statusQuitacao = json['StatusQuitacao'];
    cnpjQuitador = json['CnpjQuitador'];
    criterioAceite = json['CriterioAceite'];
    codigoInterno = json['CodigoInterno'];
    valorMercadoriaTotal = json['ValorMercadoriaTotal'];
    valorMercadoriaUnidade = json['ValorMercadoriaUnidade'];
    dataQuitacao = json['DataQuitacao'];
    diferencaFrete = json['DiferencaFrete'];
    diferencaFreteTolerancia = json['DiferencaFreteTolerancia'];
    tipoDeQuebra = json['TipoDeQuebra'];
    limiteMinQuebra = json['LimiteMinQuebra'];
    limiteMaxQuebra = json['LimiteMaxQuebra'];
    pagarMotorista = json['PagarMotorista'];
    cpfCnpjMotorista = json['CpfCnpjMotorista'];
    cartaFrete = json['CartaFrete'];
    pagtoContaDigital = json['PagtoContaDigital'];
    descricaoFilial = json['DescricaoFilial'];
    motivoPesoEntrega = json['MotivoPesoEntrega'];
    dataAlteracaoPesoEntrega = json['DataAlteracaoPesoEntrega'];
    pesoCargaOriginal = json['pesoCargaOriginal'];
    nomeRemetente = json['NomeRemetente'];
    nomeDestinatario = json['NomeDestinatario'];
    nomeMotorista = json['NomeMotorista'];
    nomeContratado = json['NomeContratado'];
    observacoes = json['Observacoes'];
    pesoEntregaOriginal = json['PesoEntregaOriginal'];
    valoresAdicionais = json['ValoresAdicionais'];
    totalDeDiferencaFrete = json['TotalDeDiferencaFrete'];
    totalDeQuebra = json['TotalDeQuebra'];
    seguradoNome = json['SeguradoNome'];
    seguradoCPF = json['SeguradoCPF'];
    seguradoSexo = json['SeguradoSexo'];
    seguradoDataNascimento = json['SeguradoDataNascimento'];
    protocoloContingenciado = json['ProtocoloContingenciado'];
    dataContingenciado = json['DataContingenciado'];
    codigoVerificadorContingenciado = json['CodigoVerificadorContingenciado'];
    isPlatform = json['is_platform'];
    descricaoNaturezaCarga = json['DescricaoNaturezaCarga'];
    // if (json['Parcelas'] != null) {
    //   parcelas = <Null>[];
    //   json['Parcelas'].forEach((v) {
    //     parcelas!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['Retificacoes'] != null) {
    //   retificacoes = <Null>[];
    //   json['Retificacoes'].forEach((v) {
    //     retificacoes!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CpfCnpjContratado'] = this.cpfCnpjContratado;
    data['RNTRCContratado'] = this.rNTRCContratado;
    data['Veiculos'] = this.veiculos;
    data['CpfCnpjContratante'] = this.cpfCnpjContratante;
    data['CpfCnpjDestinatario'] = this.cpfCnpjDestinatario;
    data['CodigoMunicipioOrigem'] = this.codigoMunicipioOrigem;
    data['CodigoMunicipioDestino'] = this.codigoMunicipioDestino;
    data['CodigoNaturezaCarga'] = this.codigoNaturezaCarga;
    data['PesoCarga'] = this.pesoCarga;
    data['DataInicioViagem'] = this.dataInicioViagem;
    data['DataFimViagem'] = this.dataFimViagem;
    data['TipoViagem'] = this.tipoViagem;
    data['RNTRCContratante'] = this.rNTRCContratante;
    data['ValorTarifas'] = this.valorTarifas;
    data['QuantidadeTarifas'] = this.quantidadeTarifas;
    data['CodigoIdentificacaoOperacao'] = this.codigoIdentificacaoOperacao;
    data['DataDeclaracaoTransporte'] = this.dataDeclaracaoTransporte;
    data['FlagContingencia'] = this.flagContingencia;
    data['FlagCliente'] = this.flagCliente;
    data['CodigoVerificador'] = this.codigoVerificador;
    data['Protocolo'] = this.protocolo;
    data['ProtocoloCancelamento'] = this.protocoloCancelamento;
    data['DataCancelamento'] = this.dataCancelamento;
    data['ProtocoloEncerramento'] = this.protocoloEncerramento;
    data['DataEncerramento'] = this.dataEncerramento;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['cte'] = this.cte;
    data['ValorFreteTotal'] = this.valorFreteTotal;
    data['IRRF'] = this.iRRF;
    data['INSS'] = this.iNSS;
    data['SEST_SENAT'] = this.sESTSENAT;
    data['Outros'] = this.outros;
    data['Pedagio'] = this.pedagio;
    data['ValorFretePorUnidade'] = this.valorFretePorUnidade;
    data['PesoCargaEntregue'] = this.pesoCargaEntregue;
    data['DataEntrega'] = this.dataEntrega;
    data['OutrosDescricao'] = this.outrosDescricao;
    data['StatusQuitacao'] = this.statusQuitacao;
    data['CnpjQuitador'] = this.cnpjQuitador;
    data['CriterioAceite'] = this.criterioAceite;
    data['CodigoInterno'] = this.codigoInterno;
    data['ValorMercadoriaTotal'] = this.valorMercadoriaTotal;
    data['ValorMercadoriaUnidade'] = this.valorMercadoriaUnidade;
    data['DataQuitacao'] = this.dataQuitacao;
    data['DiferencaFrete'] = this.diferencaFrete;
    data['DiferencaFreteTolerancia'] = this.diferencaFreteTolerancia;
    data['TipoDeQuebra'] = this.tipoDeQuebra;
    data['LimiteMinQuebra'] = this.limiteMinQuebra;
    data['LimiteMaxQuebra'] = this.limiteMaxQuebra;
    data['PagarMotorista'] = this.pagarMotorista;
    data['CpfCnpjMotorista'] = this.cpfCnpjMotorista;
    data['CartaFrete'] = this.cartaFrete;
    data['PagtoContaDigital'] = this.pagtoContaDigital;
    data['DescricaoFilial'] = this.descricaoFilial;
    data['MotivoPesoEntrega'] = this.motivoPesoEntrega;
    data['DataAlteracaoPesoEntrega'] = this.dataAlteracaoPesoEntrega;
    data['pesoCargaOriginal'] = this.pesoCargaOriginal;
    data['NomeRemetente'] = this.nomeRemetente;
    data['NomeDestinatario'] = this.nomeDestinatario;
    data['NomeMotorista'] = this.nomeMotorista;
    data['NomeContratado'] = this.nomeContratado;
    data['Observacoes'] = this.observacoes;
    data['PesoEntregaOriginal'] = this.pesoEntregaOriginal;
    data['ValoresAdicionais'] = this.valoresAdicionais;
    data['TotalDeDiferencaFrete'] = this.totalDeDiferencaFrete;
    data['TotalDeQuebra'] = this.totalDeQuebra;
    data['SeguradoNome'] = this.seguradoNome;
    data['SeguradoCPF'] = this.seguradoCPF;
    data['SeguradoSexo'] = this.seguradoSexo;
    data['SeguradoDataNascimento'] = this.seguradoDataNascimento;
    data['ProtocoloContingenciado'] = this.protocoloContingenciado;
    data['DataContingenciado'] = this.dataContingenciado;
    data['CodigoVerificadorContingenciado'] =
        this.codigoVerificadorContingenciado;
    data['is_platform'] = this.isPlatform;
    data['DescricaoNaturezaCarga'] = this.descricaoNaturezaCarga;
    if (this.parcelas != null) {
      data['Parcelas'] = this.parcelas!.map((v) => '').toList();
    }
    if (this.retificacoes != null) {
      data['Retificacoes'] = this.retificacoes!.map((v) => '').toList();
    }
    return data;
  }
}
