json.extract! servico, :id, :prestador, :tipoServico, :saida, :retorno, :qtd, :peso_saida, :peso_retorno, :totalServico, :ref_peca, :solicitante, :status, :qtdAproduzir, :created_at, :updated_at
json.url servico_url(servico, format: :json)
