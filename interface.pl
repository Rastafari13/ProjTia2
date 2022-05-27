
:-[bd,bc].

menu:- nl,write('Bem-vindo ao sistema de criacao de itenerarios!'), nl,nl,
               write('Qual a sua preferencia na viagem que quer fazer?'),nl,nl,
               write('1. Viagem com menor custo.'),nl,
               write('2. Viagem com menor distancia.'),nl,
               read(C),nl,
               write('Para onde se quer deslocar? '),
               nl, nl, read(A), questao1(A,C).


questao1(A,C):- nl,nl,nl, write('De que local pretende partir?'), nl, nl, read(B), questao2(A,B,C).


questao2(A,B,C):- nl,nl,nl,write('Possiveis percursos de '), write(B), write(' ate '), write(A),write(' : '), nl, nl, resposta1(A,B,C).

listar([X|Y]) :- listar1(X), nl , listar(Y).
listar(_).

listar1([X|Y]) :- write(X), write(' ') , listar1(Y).
listar1(_).

resposta1(A,B,C):- findall(L,caminho(A,B,L),L1), listar(L1), questao3(A,B,C).


questao3(A,B,C) :- ((1==C),nl, nl, write('Percurso com menor custo de '), write(B), write(' ate '), write(A), nl, nl, resposta2(A,B);
					(2==C),nl, nl, write('Percurso com menor distancia de '), write(B), write(' ate '), write(A), nl, nl, resposta3(A,B)
).


resposta2(A,B) :- caminhoMenosDespesa(A,B,C),write(C),nl, finalizar().

resposta3(A,B) :- caminhoMaisCurto(A,B,C),write(C),nl, finalizar().


finalizar():- nl, nl,write('Obrigado pela preferencia!'), nl, nl,
                     write('Se quiser fazer outro itenerario, marque 1.'),nl,nl,
                     write('Caso esteja satisfeito com a resposta, marque 0. Ate breve!'),nl,nl,
            read(Z),((Z == 0), halt;
                     (Z == 1), menu).