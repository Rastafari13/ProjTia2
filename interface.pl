
:-[bd,bc].

menu :- nl,write('Bem-vindo ao sistema de criacao de itenerarios!'),nl,
           write('Qual a sua preferencia na viagem que quer fazer?'),nl,nl,
           write('1- Viagem com menor custo.'),nl,
           write('2- Viagem com menor distancia.'),nl,nl,
           read(Y),
           avaliar(Y).

avaliar(1):- questao1(A,C).
avaliar(2):- questao1(A,C).
avaliar(other):- write('Por favor, escolha apenas opcoes validas.'), menu.

questao1(A,C):- write('De onde pretende partir? '), nl, nl,
                write('1- L1.'),nl,
                write('2- L3.'),nl,
                write('3- L4.'),nl,
                write('4- L5.'),nl,
                write('5- L6.'),nl,
                write('6- L7.'),nl,
                write('7- L8.'),nl, nl,
                read(A),
                (
                (A==1), questao2(A,C);
                (A==2), questao2(A,C);
                (A==3), questao2(A,C);
                (A==4), questao2(A,C);
                (A==5), questao2(A,C);
                (A==6), questao2(A,C);
                (A==7), questao2(A,C)).

questao2(A,C):- nl,nl,nl, write('Qual o destino que pretende com partida na opcao '),write(A),nl,nl,
                write('1- L1.'),nl,
                write('2- L2.'),nl,
                write('3- L3.'),nl,
                write('4- L4.'),nl,
                write('5- L5.'),nl,
                write('6- L6.'),nl,
                write('7- L7.'),nl,
                write('8- L8.'),nl, nl,
                read(B),
                (
                (B==1), questao3(A,B,C);
                (B==2), questao3(A,B,C);
                (B==3), questao3(A,B,C);
                (B==4), questao3(A,B,C);
                (B==5), questao3(A,B,C);
                (B==6), questao3(A,B,C);
                (B==7), questao3(A,B,C);
                (B==8), questao3(A,B,C)).


questao3(A,B,C):- nl,nl,nl,write('Percursos Possiveis com partida na opcao '), write(A), write(' e destino na opcao '), write(B),
                           write(' : '), nl, nl, resposta1(A,B,C).

%listar([X|Y]) :- listar1(X), nl , listar(Y).
%listar(_).

%listar1([X|Y]) :- write(X), write(' ') , listar1(Y).
%listar1(_).

resposta1(A,B,C):- caminhoMaisCurto(A,B,C), questao4(A,B,C).


questao4(A,B,C) :- ((1==C),nl, nl, write('O percurso com menor custo partindo da opcao '), write(A), write(' e com destino na opcao '), write(B), nl, nl, resposta2(A,B,C);
				    (2==C),nl, nl, write('O percurso com menor distancia partindo da opcao '), write(A), write(' e com destino na opcao '), write(B), nl, nl, resposta3(A,B,C)
).


resposta2(A,B,C) :- caminhoMenosDespesa(A,B,C),write(C),nl, finalizar().

resposta3(A,B,C) :- caminhoMaisCurto(A,B,C),write(C),nl, finalizar().


finalizar():- nl, nl,write('Obrigada pela preferencia!'),nl,nl,
                     write('Esperamos por si em breve.').


