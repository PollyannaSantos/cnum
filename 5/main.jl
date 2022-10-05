using LinearAlgebra

println("Aula 5")
println(" ")

# Método de Jacobi

A = [1 1 1 ;
     4 4 2 ;
     2 1 -1]

B = [1 ; 2 ; 0]

X = A \ B
#Barra invertida: Método de Gauss em Julia

println(X)
println( )
error = 10^-3

function jacobi(A, B, k)
  n = size(B,1)
  X = zeros(n)
  K = zeros(n)
  for l = 1:k
    for i = 1:n
      count = 0
      for j = 1:n
        if i != j
          count += A[i,j]*X[j]
          end
        end
          K[i] = (B[i]-count)/A[i,i]
        end
        # println(norm(X-K))
        if norm(X-K) < error
          break
        end
        X = copy(K)
      end
      return X
    end

    X = jacobi(A, B, 10)
    println(X)
    println( )

A = [2 1 -1 ;
     4 4 2 ;
     1 1 1]

B = [0 ; 2 ; 1]

    X = jacobi(A, B, 100)
    println(X)
    println( )

# Método de Gauss-Seidel

function seidel(A, B, k)
  n = size(B,1)
  X = zeros(n)
  K = zeros(n)
  for l = 1:k
    for i = 1:n
      count = [0.0 0.0]
      for j = 1:i-1
        count[1] += A[i,j]*K[j]
      end
      for j = i+1:n
      count[2] += A[i,j]*X[j]
      end
      K[i] = (B[i]-count[1]-count[2])/A[i,i]
      end
    if norm(X-K) < error
      break
    end
    X = copy(K)
  end
  return X
end

X = seidel(A, B, 100)
println(X)