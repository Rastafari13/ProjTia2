
%custo(alojamento, custo)
custo('l1',50).
custo('l2',0).
custo('l3',240).
custo('l4',150).
custo('l5',400).
custo('l6',70).
custo('l7',30).
custo('l8',100).


%percurso(Origem, Destino, DistanciaEmKm)
percurso('l1','l3',25).
percurso('l1','l5',100).
percurso('l1','l6',55).
percurso('l1','l7',34).
percurso('l1','l8',55).
percurso('l3','l4',40).
percurso('l4','l2',20).
percurso('l5','l2',25).
percurso('l6','l2',30).
percurso('l7','l6',15).
percurso('l7','l2',20).
percurso('l8','l7',25).
percurso('l8','l3',30).

percurso('l3','l1',25).
percurso('l5','l1',100).
percurso('l6','l1',55).
percurso('l7','l1',34).
percurso('l8','l1',55).
percurso('l4','l3',40).
percurso('l2','l4',20).
percurso('l2','l5',25).
percurso('l2','l6',30).
percurso('l6','l7',15).
percurso('l2','l7',20).
percurso('l7','l8',25).
percurso('l3','l8',30).

%arco(Origem, Destino)
arco('l1','l3').
arco('l1','l5').
arco('l1','l6').
arco('l1','l7').
arco('l1','l8').
arco('l3','l4').
arco('l4','l2').
arco('l5','l2').
arco('l6','l2').
arco('l7','l6').
arco('l7','l2').
arco('l8','l7').
arco('l8','l3').


