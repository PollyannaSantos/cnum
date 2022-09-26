using LinearAlgebra

function fixedpoint(a, g , error)
  x = g(a)
  while norm(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

#Exercícios 5.1.2, 5.1.5, 5.1.10, 5.1.12

println("Exercício 5.1.2:")

F(x) = [(2*x[1] - cos(x[1]) -x[2]);
(-x[1] + 2*x[2] - cos(x[2]) -x[3]);
(-x[2] + x[3] - cos(x[3]))]

J(x) = [(2 + sin(x[1])) -1 0;
-1 (2 + sin(x[2])) -1;
0 -1 (1 + sin(x[3]))]

g(x) = x - (inv(J(x))*F(x))

error = 10^-8

x = [1 ; 1 ; 1]
r = fixedpoint(x, g, error)
println(r)

x = [-0.5 ;-2 ;-3]
r = fixedpoint(x, g, error)
println(r)

x = [-2 ; -3 ; -4]
r = fixedpoint(x, g, error)
println(r)

x = [0 ; 0 ; 0]
r = fixedpoint(x, g, error)
println(r)
println(" ")
println("Exercício 5.1.5:")
println(" ")
println("Exercício 5.1.10:")
println(" ")
println("Exercício 5.1.12:")