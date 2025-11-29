function gorjeta = calcular_gorjeta_procedural(comida, servico)
  % Função para calcular a gorjeta usando lógica procedural.
  % Entradas: comida (0-10), servico (0-10)
  % Saída: gorjeta (em porcentagem: 5, 10 ou 15)

  % Gorjeta Alta (15%) - Surpreendente: Se Comida OU Serviço for > 7
  if (comida > 7 || servico > 7)
    gorjeta = 15;
    return;
  endif

  % Gorjeta Baixa (5%) - Ruim: Se Comida OU Serviço for < 5
  if (comida < 5 || servico < 5)
    gorjeta = 5;
    return;
  endif

  % Gorjeta Média (10%) - Bom: Se não caiu nas regras acima, significa
  % que ambos estão na faixa "Bom" (5 a 7, inclusivo).
  gorjeta = 10;
endfunction

% Exemplos de Teste Procedural:
disp(['Gorjeta para Comida=8, Servico=9: ', num2str(calcular_gorjeta_procedural(8, 9)), '%']); % Esperado: 15
% disp(['Gorjeta para Comida=6, Servico=6: ', num2str(calcular_gorjeta_procedural(6, 6)), '%']); % Esperado: 10
% disp(['Gorjeta para Comida=3, Servico=7: ', num2str(calcular_gorjeta_procedural(3, 7)), '%']); % Esperado: 5
% disp(['Gorjeta para Comida=8, Servico=3: ', num2str(calcular_gorjeta_procedural(8, 3)), '%']); % Esperado: 15 (Regra mais forte prevalece)
