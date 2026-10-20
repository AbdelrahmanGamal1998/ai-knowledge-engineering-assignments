
%MOVE
move(s(0,0,M3,C1,C2,C3),s(1,1,M3,C1,C2,C3)).
move(s(1,1,M3,C1,C2,C3),s(0,0,M3,C1,C2,C3)).

move(s(0,M2,0,C1,C2,C3),s(1,M2,1,C1,C2,C3)).
move(s(1,M2,1,C1,C2,C3),s(0,M2,0,C1,C2,C3)).

move(s(M1,0,0,C1,C2,C3),s(M1,1,1,C1,C2,C3)).
move(s(M1,1,1,C1,C2,C3),s(M1,0,0,C1,C2,C3)).



%-------------------
move(s(M1,M2,M3,0,0,C3),s(M1,M2,M3,1,1,C3)).
move(s(M1,M2,M3,1,1,C3),s(M1,M2,M3,0,0,C3)).

move(s(M1,M2,M3,0,C2,0),s(M1,M2,M3,1,C2,1)).
move(s(M1,M2,M3,1,C2,1),s(M1,M2,M3,0,C2,0)).

move(s(M1,M2,M3,C1,0,0),s(M1,M2,M3,C1,1,1)).
move(s(M1,M2,M3,C1,1,1),s(M1,M2,M3,C1,0,0)).

%-------------------
move(s(0,M2,M3,C1,C2,C3),s(1,M2,M3,C1,C2,C3)).
move(s(1,M2,M3,C1,C2,C3),s(0,M2,M3,C1,C2,C3)).



move(s(M1,0,M3,C1,C2,C3),s(M1,1,M3,C1,C2,C3)).
move(s(M1,1,M3,C1,C2,C3),s(M1,0,M3,C1,C2,C3)).


move(s(M1,M2,0,C1,C2,C3),s(M1,M2,1,C1,C2,C3)).
move(s(M1,M2,1,C1,C2,C3),s(M1,M2,0,C1,C2,C3)).

%-------------------
move(s(M1,M2,M3,0,C2,C3),s(M1,M2,M3,1,C2,C3)).
move(s(M1,M2,M3,1,C2,C3),s(M1,M2,M3,0,C2,C3)).

move(s(M1,M2,M3,C1,0,C3),s(M1,M2,M3,C1,1,C3)).
move(s(M1,M2,M3,C1,1,C3),s(M1,M2,M3,C1,0,C3)).

move(s(M1,M2,M3,C1,C2,0),s(M1,M2,M3,C1,C2,1)).
move(s(M1,M2,M3,C1,C2,1),s(M1,M2,M3,C1,C2,0)).


%-------------------
move(s(0,M2,M3,0,C2,C3),s(1,M2,M3,1,C2,C3)).
move(s(1,M2,M3,1,C2,C3),s(0,M2,M3,0,C2,C3)).


move(s(0,M2,M3,C1,0,C3),s(1,M2,M3,C1,1,C3)).
move(s(1,M2,M3,C1,1,C3),s(0,M2,M3,C1,0,C3)).

move(s(0,M2,M3,C1,C2,0),s(1,M2,M3,C1,C2,1)).
move(s(1,M2,M3,C1,C2,1),s(0,M2,M3,C1,C2,0)).


move(s(M1,0,M3,0,C2,C3),s(M1,1,M3,1,C2,C3)).
move(s(M1,1,M3,1,C2,C3),s(M1,0,M3,0,C2,C3)).

move(s(M1,0,M3,C1,0,C3),s(M1,1,M3,C1,1,C3)).
move(s(M1,1,M3,C1,1,C3),s(M1,0,M3,C1,0,C3)).



move(s(M1,0,M3,C1,C2,0),s(M1,1,M3,C1,C2,1)).
move(s(M1,1,M3,C1,C2,1),s(M1,0,M3,C1,C2,0)).



move(s(M1,M2,0,0,C2,C3),s(M1,M2,1,1,C2,C3)).
move(s(M1,M2,1,1,C2,C3),s(M1,M2,0,0,C2,C3)).



move(s(M1,M2,0,C1,0,C3),s(M1,M2,1,C1,1,C3)).
move(s(M1,M2,1,C1,1,C3),s(M1,M2,0,C1,0,C3)).



move(s(M1,M2,0,C1,C2,0),s(M1,M2,1,C1,C2,1)).
move(s(M1,M2,1,C1,C2,1),s(M1,M2,0,C1,C2,0)).










safestate(s(M1,M2,M3,C1,C2,C3)):-
M1+M2>=C1+C2+C3;
M2+M3>=C1+C2+C3;
M1+M3>=C1+C2+C3;
M1+M2>=C1+C2;
M1+M3>=C1+C2;
M2+M3>=C1+C2;
%-----------
M1+M2>=C2+C3;
M1+M3>=C2+C3;
M2+M3>=C2+C3;
%--------------
M1+M2>=C1+C3;
M1+M3>=C1+C3;
M2+M3>=C1+C3.



game(S,G):-
path(S,[S],G).
path(s(1,1,1,1,1,1),G,G).
path(State,Visited,Goal):-
move(State,Nextstate),
 safestate(Nextstate),
\+member(Nextstate,Visited),
path(Nextstate,[Nextstate|Visited],Goal).























































