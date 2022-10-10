using LinearAlgebra

println("Aula 10")
println(" ")

println("Exercício  7.1.2:")

x = [-0.35 ; 0.15 ; 0.23 ; 0.35]
y = [0.2 ; -0.5 ; 0.54 ; 0.7]

V = [1 x[1]  ; 
     1 x[2]  ; 
     1 x[3]  ; 
     1 x[4]  ]

function a(V, y)
  vt = transpose(V)
  a = inv(vt*V)*(vt*y)
  return a
end

r = a(V, y)
println(r)
println(" ")


println("Exercício  7.2.3:")

x = [0 ; 0.25 ; 0.50 ; 0.75] ; 1]
y = [-153 ; 64 ; 242 ;  ]

M(x) = 

V = M(x)

r = a(V, y)