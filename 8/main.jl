using LinearAlgebra
using .MathConstants:e

println("Aula 8")
println(" ")

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

error = 10^-8

F(x) = [(2*x[1] - cos(x[1]) -x[2]);
        (-x[1] + 2*x[2] - cos(x[2]) -x[3]);
        (-x[2] + x[3] - cos(x[3]))]

J(x) = [(2 + sin(x[1])) -1 0;
        -1 (2 + sin(x[2])) -1;
         0 -1 (1 + sin(x[3]))]

g(x) = x - (inv(J(x))*F(x))

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

F(x) = [ (6*x[1]-2*x[2]+e^(x[3])-2) ;
         (sin(x[1])-x[2]+x[3]) ;
         (sin(x[1])+2*x[2]+3*x[3]-1) ]

J(x) = [ (6) (-2) (e^(x[3])) ;
         (-cos(x[1])) (-1) (1) ;
         (-cos(x[1])) (2) (3) ]

x = [0 ; 0 ; 0]
r = fixedpoint(x, g, error)
println(r)
println(" ")

println("Exercício 5.1.10:")
F(x) = [ (((1/8)*((x[1])^2))+((1/5)*((x[2]-1)^2))-1) ;
         ((atan(x[1]))+(x[1])-(x[2])-(x[2]^3)) ]

J(x) = [ (x[1]/4) ((1/5)*((2*x[2])-2)) ;
         (((x[1]^2)+2)/((x[1]^2)+1)) (-(3*x[2]^2)-1) ]

x = [-1 ; -1]
r = fixedpoint(x, g, error)
println(r)

x = [3 ; 1]
r = fixedpoint(x, g, error)
println(r)
println(" ")

println("Exercício 5.1.12:")
C1(x) = (10+(0.3*x)+((10^-4)*(x^2))+(3.4*(10^-9)*(x^4)))
C2(x) = (50+(0.25*x)+(2*(10^-4)*(x^2))+(4.3*(10^-7)*(x^3)))
C3(x) = (500+(0.19*x)+(5*(10^-4)*(x^2))+(1.1*(10^-7)*(x^4)))
C(x,y,z) = C1(x) + C2(y) + C3(z)
E(x,y,z) = x+y+z-1500
L(x,y,z,k) = C(x,y,z)-(k*E(x,y,z))
Lx(x,k) = (0.3+(2*(10^-4)*x)+(4*3.4*(10^-9)*(x^3)))-k
Ly(y,k) = (0.25+(4*(10^-4)*y)+(3*4.3*(10^-7)*(y^2)))-k
Lz(z,k) = (0.19+(2*5*(10^-4)*z)+(4*1.1*(10^-7)*(z^3)))-k

F(x) = [ (x[1]+x[2]+x[3]-1500) ;
         ((0.3+(2*(10^-4)*x[1])+(4*3.4*(10^-9)*(x[1]^3)))-x[4]) ;
         ((0.25+(4*(10^-4)*x[2])+(3*4.3*(10^-7)*(x[2]^2)))-x[4]) ;
         ((0.19+(2*5*(10^-4)*x[3])+(4*1.1*(10^-7)*(x[3]^3)))-x[4]) ]

J(x) = [ (1) (1) (1) (0) ;
         ((2*(10^-4))+(3*4*3.4*(10^-9)*(x[1]^2))) (0) (0) (-1) ;
         (0) ((4*(10^-4))+(2*3*4.3*(10^-7)*(x[2]))) (0) (-1) ;
         (0) (0) ((2*5*(10^-4))+(3*4*1.1*(10^-7)*(x[3]^2))) (-1) ]

x = [500 ; 500 ; 500 ; 1]
r = fixedpoint(x, g, error)
println(r)