:- dynamic comprimento/2 .
:- dynamic preco/2 .
:- dynamic despesaKM/2 .
:-[bd].

%PrecoCaminho
precoCaminho([],0).
precoCaminho([X|R],Soma) :- custo(X,TotalLocal),
precoCaminho(R,TotalCaminho), Soma is TotalLocal + TotalCaminho.

guardarPrecoCaminho(Caminho):- precoCaminho(Caminho, Valor),
assertz(preco(Caminho, Valor)).

gerarPrecosCaminhos([]).
gerarPrecosCaminhos([C1|R1]):- guardarPrecoCaminho(C1), gerarPrecosCaminhos(R1).


%DistanciaCaminho
calcularDistancia(_,[],0).
calcularDistancia(P1,[P2|R2], Soma):- percurso(P2,P1,Distancia),
calcularDistancia(P2, R2, DistanciaPercorrida), Soma is Distancia + DistanciaPercorrida.

guardarDistancia([]).
guardarDistancia([P1|R1]):- calcularDistancia(P1,R1,Valor), assertz(comprimento([P1|R1], Valor)).

gerarDistanciasCaminhos([]).
gerarDistanciasCaminhos([C1|R1]):- guardarDistancia(C1), gerarDistanciasCaminhos(R1).

distanciaCaminho([P1|R1], Valor):-  calcularDistancia(P1,R1,Valor).

%DespesasKM
calcularDespesasKM(Caminho):- guardarDistancia(Caminho), guardarPrecoCaminho(Caminho),
preco(Caminho, DespesaCaminho), comprimento(Caminho, DistanciaCaminho),
assertz(despesaKM(Caminho, DespesaCaminho / DistanciaCaminho)).

gerarDespesasKM([]).
gerarDespesasKM([C1|R1]):- calcularDespesasKM(C1), gerarDespesasKM(R1).

passageiroKMCaminho(Caminho, Indice):- guardarDistancia(Caminho), guardarPrecoCaminho(Caminho),
ocupacao(Caminho, DespesaCaminho), comprimento(Caminho, DistanciaCaminho), Indice is DespesaCaminho / DistanciaCaminho.

%CaminhosDisponiveis
caminho(X,Z,Caminho):- caminho(X,Z,[X],Caminho).
caminho(X,X,Caminho,Caminho):- precoCaminho(Caminho,Soma), Soma =< 450.
caminho(X,Z,Visitado,Caminho):- percurso(X,Y,_), \+ member(Y,Visitado),
caminho(Y,Z,[Y | Visitado],Caminho).

%GerarListaCaminhos
listaCaminhos(X,Y,Lista):- findall(C,caminho(X,Y,C),Lista).

%CaminhoMaisCurto
caminhoMaisCurto(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista),
gerarDistanciasCaminhos(Lista), maisCurto(Caminho).

maisCurto(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V > V1).


%CaminhoMaisLongo
caminhoMaisLongo(X,Y,Caminho):- retractall(comprimento(_,_)), listaCaminhos(X,Y,Lista),
gerarDistanciasCaminhos(Lista), maisLongo(Caminho).

maisLongo(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V1 > V).

%CaminhoMenosDespesa
caminhoMenosDespesa(X,Y,Caminho):- retractall(preco(_,_)), listaCaminhos(X,Y,Lista),
gerarPrecosCaminhos(Lista), menosDespesa(Caminho).

menosDespesa(Caminho):- preco(Caminho, V), \+ (preco(_, V1), V > V1).

%CaminhoMaisDespesa
caminhoMaisDespesa(X,Y,Caminho):- retractall(preco(_,_)), listaCaminhos(X,Y,Lista),
gerarPrecosCaminhos(Lista), maisDespesa(Caminho).

maisDespesa(Caminho):- preco(Caminho, V), \+ (preco(_, V1), V1 > V).

%CaminhoMaisVantajoso
caminhoMaisVantajoso(X,Y,Caminho):- retractall(despesaKM(_,_)), listaCaminhos(X,Y,Lista),
gerarDespesasKM(Lista),!, maisVantajoso(Caminho).

maisVantajoso(Caminho):- despesaKM(Caminho, V), \+ (despesaKM(_, V1), V1 < V).