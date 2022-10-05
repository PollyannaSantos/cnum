using .MathConstants:e

println("Aula 3")
println(" ")

#  Método do Ponto Fixo
f(x) = e^x-x-2

error = 10^-3

function fixedpoint(a,g)
  x = g(a)
  while abs(x-a) > error
    a = x
    x = g(a)
  end
  return x
end

g(x) = log(x+2)
r = fixedpoint(1,g)
println(r)

g(x) = e^x-2
r = fixedpoint(-1,g)
println(r)

#  Método de Newton-Raphson (Adaptação do Ponto fixo)
g(x) = x-((e^x-x-2)/(e^x-1))
r = fixedpoint(1,g)
println(r)

g(x) = e^x-2
r = fixedpoint(-1,g)
println(r)

#  Método da Secante
function secant(a,b)
g(a,b) = (a*f(b)-b*f(a))/(f(b)-f(a))
x = g(a,b)
while abs(x-a) > error
    a = b
    b = x
    x = g(a,b)
  end
  return x
end

r = secant(1,2)
println(r)
r = secant(-2,-1)
println(r)
println( )

#  Os valores diferentes por causa do valor do erro estabelecido.

# Exercício 3.3.1
println("Exercício 3.3.1")
f(x) = ln(x-2)
error = 10^-8
g(x) = MathConstants.e^(x)-2
r = fixedpoint(1,g)
println(r)
println( )

# Exercício 3.4.1
println("Exercício  3.4.1")
f(x) = cos(x) - x^2
error = 10^-5
g(x) = x + ((cos(x) - x^2)/(sin(x)+2x))
r = fixedpoint(1,g)
println(r)
println( )

# Exercício 3.6.3
println("Exercício  3.6.3")
f(x) = MathConstants.e^(-x^2)/2
r = secant(1,2)
println(r)
println( )

# Exercício 3.6.4
println("Exercício  3.6.4:")
Ir = 10^-12
T = 300
k = 1.380649*(10^-23)
q = 1.60217663*(10^-19)
I(x) = Ir*(MathConstants.e^((x*q)/(k*T)) - 1)
g(x,V,R) = R*I(x) + x - V
dg(x,R) = R*dI(x) + 1
d(x,R,f) = x - (f(x)/dg(x,R))
error = 10^-3
println("a)")
# ((10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x-30
f(x) = g(x, 30, 1)
h(x) = d(x,1,f)
r = fixedpoint(0.8,h,error)
println(r)
r = secant(0.8,0.9,h,error)
println(r)
# ((10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x-3
println("b)")
f(x) = g(x, 3, 1)
h(x) = d(x,1,f)
r = fixedpoint(0.7,h,error)
println(r)
r = secant(0.7,0.8,h,error)
println(r)
# (10*(10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x-3
println("c)")
f(x) = g(x, 3, 1)
h(x) = d(x,10,f)
r = fixedpoint(0.6,h,error)
println(r)
r = secant(0.6,0.7,h,error)
println(r)
# ((10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x-(300*10^-3)
println("d)")
f(x) = g(x, 300, 1)
h(x) = d(x,1,f)
r = fixedpoint(0.29,h,error)
println(r)
r = secant(0.29,0.31,h,error)
println(r)
# ((10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x-((-300)*10^-3)
println("e)")
f(x) = g(x, -300, 1)
h(x) = d(x,1,f)
r = fixedpoint(-0.29,h,error)
println(r)
r = secant(-0.29,-0.31,h,error)
println(r)
# ((10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x+30
println("f)")
f(x) = g(x, -30, 1)
h(x) = d(x,1,f)
r = fixedpoint(-0.29,h,error)
println(r)
r = secant(-29.9,-30.1,h,error)
println(r)
# (10*(10^-12)*(e^((x*(1.60217663*10^-19))/((1.380649*10^-23)*(300)))-1))+x+30
println("g)")
f(x) = g(x, -30, 1)
h(x) = d(x,10,f)
r = fixedpoint(-29.9,h,error)
println(r)
r = secant(-29.9,-30.1,h,error)
println(r)