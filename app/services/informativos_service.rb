class InformativosService
  def import_stocks
    # fazer a requisição para o informativos
    response = InformativosConnector.securities(['STOCK'])
    # iterar sobre a resposta, havendo uma
    JSON.parse(response.body).each do |row|
      # para cada item na resposta, verificar se é preciso inserir ou atualizar
      security = Security.find_or_initialize_by(symbol: row['symbol'])
      security.security_type = row['security_type']
      security.isin = row['isin']
      security.save
    end
  end
end
