using LinearAlgebra

println("Aula 10")
println(" ")

function a(V, y)
  vt = transpose(V)
  a = inv(vt*V)*(vt*y)
  return a
end

println("Exercício  7.1.2:")

x = [-0.35 ; 0.15 ; 0.23 ; 0.35]
y = [0.2 ; -0.5 ; 0.54 ; 0.7]

V = [1 x[1]  ; 
     1 x[2]  ; 
     1 x[3]  ; 
     1 x[4]  ]

r = a(V, y)
println(r)
println(" ")


println("Exercício  7.2.3:")

x = [0 ; 0.1 ; 0.2 ; 0.3 ; 0.4 ; 0.5 ; 0.6 ; 0.7 ; 0.8 ; 0.9 ; 1.0] 
y = [31 ; 35 ; 37 ; 33 ; 28 ; 20 ; 16 ; 15 ; 18 ; 23 ; 31]

M(x) = [1 x[1] + x[1]*sin(2*pi*x[1]) + x[1]*cos(2*pi*x[1])    ;
        1 x[2] + x[2]*sin(2*pi*x[2]) + x[2]*cos(2*pi*x[2])    ;
        1 x[3] + x[3]*sin(2*pi*x[3]) + x[3]*cos(2*pi*x[3])    ;
        1 x[4] + x[4]*sin(2*pi*x[4]) + x[4]*cos(2*pi*x[4])    ;
        1 x[5] + x[5]*sin(2*pi*x[5]) + x[5]*cos(2*pi*x[5])    ;
        1 x[6] + x[6]*sin(2*pi*x[6]) + x[6]*cos(2*pi*x[6])    ; 
        1 x[7] + x[7]*sin(2*pi*x[7]) + x[7]*cos(2*pi*x[7])    ; 
        1 x[8] + x[8]*sin(2*pi*x[8]) + x[8]*cos(2*pi*x[8])    ;
        1 x[9] + x[9]*sin(2*pi*x[9]) + x[9]*cos(2*pi*x[9])    ;
        1 x[10] + x[10]*sin(2*pi*x[10]) + x[10]*cos(2*pi*x[10]) ;
        1 x[11] + x[11]*sin(2*pi*x[11]) + x[11]*cos(2*pi*x[11]) ]

V = M(x)
r = a(V, y)
println(r)