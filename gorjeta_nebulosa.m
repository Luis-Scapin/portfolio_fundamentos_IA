% Carregar o pacote da lógica nebulosa
pkg load fuzzy-logic-toolkit

function neb = criar_fis_gorjeta()
  % Inicializar o FIS (Fuzzy Inference System) Mamdani
  neb = newfis('GorjetaNebulosa', 'mamdani');

  % --- Variáveis de Entrada (Input) ---
  neb = addvar(neb, 'input', 'comida', [0 10]);
  neb = addmf(neb, 'input', 1, 'Ruim', 'trimf', [0 2.5 5]);
  neb = addmf(neb, 'input', 1, 'Bom', 'trimf', [4 6 8]);
  neb = addmf(neb, 'input', 1, 'Surpreendente', 'trimf', [7 8.5 10]);

  neb = addvar(neb, 'input', 'servico', [0 10]);
  neb = addmf(neb, 'input', 2, 'Ruim', 'trimf', [0 2.5 5]);
  neb = addmf(neb, 'input', 2, 'Bom', 'trimf', [4 6 8]);
  neb = addmf(neb, 'input', 2, 'Surpreendente', 'trimf', [7 8.5 10]);

  % --- Variável de Saída (Output) ---
  neb = addvar(neb, 'output', 'gorjeta', [0 20]);
  neb = addmf(neb, 'output', 1, 'Pequena', 'trimf', [0 5 10]);
  neb = addmf(neb, 'output', 1, 'Media', 'trimf', [5 10 15]);
  neb = addmf(neb, 'output', 1, 'Grande', 'trimf', [10 15 20]);

  % --- Definição das Regras (Rule Base) ---
  % Formato: [comida, servico, gorjeta, peso, operador_logico]
  % Operador Lógico: 1 para AND (E), 2 para OR (OU)
  regras = [
      1 0 1 1 2; % R1: SE Comida é Ruim OU Serviço é Ruim ENTÃO Pequena
      0 1 1 1 2; % R1 (continuação): (*, Ruim) -> Pequena
      2 2 2 1 1; % R2: SE Comida é Bom E Serviço é Bom ENTÃO Média
      3 0 3 1 2; % R3: SE Comida é Surpreendente OU Serviço é Sup. ENTÃO Grande
      0 3 3 1 2; % R3 (continuação): (*, Sup) -> Grande

      % Casos mistos (para maior robustez)
      1 3 2 1 1; % R4: SE Comida é Ruim E Serviço é Sup. ENTÃO Média
      3 1 2 1 1; % R5: SE Comida é Sup. E Serviço é Ruim ENTÃO Média
      2 1 1 1 1; % R6: SE Comida é Bom E Serviço é Ruim ENTÃO Pequena
      1 2 1 1 1; % R7: SE Comida é Ruim E Serviço é Bom ENTÃO Pequena
      2 3 3 1 1; % R8: SE Comida é Bom E Serviço é Sup. ENTÃO Grande
      3 2 3 1 1; % R9: SE Comida é Sup. E Serviço é Bom ENTÃO Grande
  ];

  neb = addrule(neb, regras);
endfunction
