% Inicializa o FIS
neb = criar_fis_gorjeta();

% Conjunto de dados de teste (Comida, Serviço)
test_data = [
    8 9;  % Cenário 1: Tudo excelente
    6 6;  % Cenário 2: Tudo na média
    3 7;  % Cenário 3: Comida ruim, Serviço bom
    8 3;  % Cenário 4: Comida excelente, Serviço ruim
    7 7;  % Cenário 5: Limite do bom/surpreendente
    4.9 5.1; % Cenário 6: Transição crítica Ruim/Bom (Teste de rigidez)
];

disp('========================================================');
disp('  COMPARAÇÃO DE CÁLCULO DE GORJETA (5%, 10%, 15%)');
disp('========================================================');
disp('Comida | Servico | Gorjeta Procedural | Gorjeta Nebulosa');
disp('--------------------------------------------------------');

for i = 1:rows(test_data)
    c = test_data(i, 1);
    s = test_data(i, 2);

    % Cálculo Procedural
    gorjeta_rigida = calcular_gorjeta_procedural(c, s);

    % Cálculo Nebuloso (Defuzzificação)
    gorjeta_nebulosa = evalfis([c s], neb);

    % Exibição dos resultados
    printf(' %5.1f | %7.1f | %12d%% | %12.2f%%\n', c, s, gorjeta_rigida, gorjeta_nebulosa);
end

disp('===================================================');
