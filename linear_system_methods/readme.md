* Problem
> solve linear system Ax=b
* Methods
> 1. Iteration methods
> > x = Tx+c<br>
> > suitable for sparse matrices
> 2. Jacobi method
> > Dx = (L+U)x+b
> 3. Gauss-Seidel method
> > (D-L)x = Ux+b
> 4. SOR method
> > (D-wL)x = [(1-w)D+wU]x+wb
