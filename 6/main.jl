using LinearAlgebra

error = 10^-3

# Método de Jacobi

function jacobi(A, B, k,error)
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

# Método de Gauss-Seidel

function seidel(A, B, k,error)
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

println("Exercício 4.7.2:")

A = [5 1 1 ;
     -1 3 -1 ;
     1 2 10]

B = [50 ; 10 ; -30]



X = A \ B
println(X)
println( )

println("Exercício 4.7.3:")

# Jacobi

X = jacobi(A, B, 100,error)
println(X)

# Seidel

X = seidel(A, B, 100,error)
println(X)
println( )


println("Exercício 4.7.5")

A = [4 0 1 ;
     1 10 3 ;
     2 1 4]

B = [6 ; 27 ; 12]

# Jacobi
X = jacobi(A, B, 100,error)
println(X)

# Seidel

X = seidel(A, B, 100,error)
println(X)
println( )

println("Exercício 4.9.1 e 4.9.2")

A = [1 0 0 0 0;
     (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2) 0 0;
     0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2) 0;
     0 0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2);
     0 0 0 (1/2) ((-1/2)+(-1/50))]

B = [127 ; 0 ; 0 ; 0 ; 0]

X = A \ B
println(X)

X = jacobi(A,B,100,error)
println(X)

X = seidel(A,B,100,error)
println(X)

A = [1 0 0 0 0;
     (1/2) ((-1/2)+(-1/2)+(-1/50)) (1/2) 0 0;
     0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2) 0;
     0 0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2);
     0 0 0 (1/2) ((-1/2)+(-1/100))]

B = [127 ; 0 ; 0 ; 0 ; 0]

X = A \ B
println(X)

X = jacobi(A,B,100,error)
println(X)

X = seidel(A,B,100,error)
println(X)

A = [((-1/2)+(-1/2)+(-1/100)) (1/2) 0 0;
     (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2) 0;
     0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2);
     0 0 (1/2) ((-1/2)+(-1/50))]

B = [(-127/2) ; 0 ; 0 ; 0]

X = A \ B
println(X)

X = jacobi(A,B,100,error)
println(X)

X = seidel(A,B,100,error)
println(X)

A = [((-1/2)+(-1/2)+(-1/50)) (1/2) 0 0;
     (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2) 0;
     0 (1/2) ((-1/2)+(-1/2)+(-1/100)) (1/2);
     0 0 (1/2) ((-1/2)+(-1/100))]

B = [(-127/2) ; 0 ; 0 ; 0]

X = A \ B
println(X)

X = jacobi(A,B,100,error)
println(X)

X = seidel(A,B,100,error)
println(X)