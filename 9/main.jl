println("Aula 9")
println(" ")

println("Exemplo:")
println(" ")

A = [1 0 0 0 ;
     1 1 1 1 ;
     1 2 4 8 ;
     1 3 9 27]

B = [1 ;
     6 ;
     5 ; 
    -8 ;]

r = A\B
println(r)
println(" ")

println("Exercício  6.1.1:")

M(x) = [1 x[1] x[1]^2 x[1]^3 ;
        1 x[2] x[2]^2 x[2]^3 ;
        1 x[3] x[3]^2 x[3]^3 ;
        1 x[4] x[4]^2 x[4]^3]

A = M([-2 0 1 2])
B = [-47 ; 
      -3 ; 
       4 ;
      41 ]

r = A\B
println(r)
println(" ")

println("Exercício  6.1.2:")

A = M([-1 0.5 1 1.25])
B = [1.25 ; 
     0.5  ; 
     1.25 ;
     1.8125 ]

r = A\B
println(r)
println(" ")