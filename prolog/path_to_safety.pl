dim(4,4).
start([1,0]).
end([2,2]).
bomb([0,1]).
bomb([1,2]).
bomb([2,0]).
bomb([3,0]).
star([2,1]).
star([2,3]).
star([3,2]).



%-----------------------

%move down
move(s(M,N,Sn,_),s(M1,N1,Sn1,Dir)):-
M1 is M+1,
N1 is N,
Dir = down,
M1>=0,
M1<4,
N1>=0,
N1<4,
(star([M,N]) -> Sn1 is Sn+1 ; Sn1 is Sn).

%move up
move(s(M,N,Sn,_),s(M1,N1,Sn1,Dir)):-
M1 is M-1,
N1 is N,
Dir = up,
M1>=0,
M1<4,
N1>=0,
N1<4,
(star([M,N]) -> Sn1 is Sn+1 ; Sn1 is Sn).

%move right
move(s(M,N,Sn,_),s(M1,N1,Sn1,Dir)):-


M1 is M,
N1 is N+1,
Dir = right,
M1>=0,
M1<4,
N1>=0,
N1<4,
(star([M,N]) -> Sn1 is Sn+1 ; Sn1 is Sn).%

%move left
move(s(M,N,Sn,_),s(M1,N1,Sn1,Dir)):-
M1 is M,
N1 is N-1,
Dir = left,
M1>=0,
M1<4,
N1>=0,
N1<4,
(star([M,N]) -> Sn1 is Sn+1 ; Sn1 is Sn).



%checkDim([M,N,M1,M2,Dir]):-

unsafestate(s(M,N,_,_)):-
bomb([M,N]).



%--------------------
path(s(2,2,S,_),_,[],S).







path(State,Visited,[H|ANS],R):-
 move(State,s(M,N,S,D)),
\+unsafestate(s(M,N,S,D)),
\+member([M,N],Visited),
  append([[M,N]],Visited,NL),
  H=D,
  path(s(M,N,S,D),NL,ANS,R).


play(s(M,N,S,_),G,Res):-
path(s(M,N,S,_),[[M,N]],G,Res).
