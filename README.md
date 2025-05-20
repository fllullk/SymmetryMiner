# SymmetryMiner
SymmetryMiner is a Julia package for detecting symmetries in square integer matrices. It computes reflectional and rotational symmetries and supports large-scale enumeration and analysis of symmetry patterns in small matrices like 2×2 and 3×3

# Theoretical Analysis on 90° Symmetry

To understand how many matrices exhibit 90° rotational symmetry, we start with the smallest non-trivial case: a 2×2 matrix.

### 2×2 Case

A general 2×2 matrix is:

$$
\begin{pmatrix}a & b \\ c & d\end{pmatrix}
$$

Applying a 90° rotation yields:

$$
\begin{pmatrix}c & a \\ d & b\end{pmatrix}
$$

For the matrix to be invariant under this rotation, it must be equal to its rotated form:

$$
\begin{pmatrix}a & b \\ c & d\end{pmatrix} = \begin{pmatrix}c & a \\ d & b\end{pmatrix}
$$

From this, we derive the constraints:
- $a = c$
- $b = a$
- $c = d$
- $d = b$

This leads to all elements being equal:

$$
\begin{pmatrix}a & a \\ a & a\end{pmatrix}
$$

So, only one unique value determines the entire matrix. If matrix entries are chosen from 4 possible values (say, 0 to 3), then the number of such symmetric matrices is:

$$
4^1 = \left(2^2\right)^1
$$

### Higher-Dimensional Cases

As we increase the matrix size, more degrees of freedom remain, though the symmetry constraints still significantly reduce the number of independent parameters. Examples:

- **3×3**:

$$
\begin{pmatrix}a & b & a \\ b & c & b \\ a & b & a\end{pmatrix}
\quad \Rightarrow \quad \left(3^2\right)^3
$$

- **4×4**:

$$
\begin{pmatrix}a & b & c & a \\ c & d & d & b \\ b & d & d & c \\ a & c & b & a\end{pmatrix}
\quad \Rightarrow \quad \left(4^2\right)^4
$$

- **5×5**:

$$
\begin{pmatrix}
a & b & c & d & a \\
d & e & f & e & b \\
c & f & g & f & c \\
b & e & f & e & d \\
a & d & c & b & a
\end{pmatrix}
\quad \Rightarrow \quad \left(5^2\right)^7
$$

In general, the number of such symmetric matrices follows the pattern:

$$
\left(n^2\right)^{x_n}
$$

### Recurrence Relation

There is a clear recurrence in the degrees of freedom due to the reuse of patterns from smaller matrices within the structure of larger ones. Specifically, part of the $(n-2)\times(n-2)$ case appears embedded within the $n \times n$ matrix. This recursive structure gives rise to the recurrence relation:

$$
x_2 = 1,\quad x_3 = 3,\quad x_n = (n - 1) + x_{n - 2},\quad n \geq 4
$$

### Closed Form and OEIS Connection

This sequence of exponents corresponds to the OEIS sequence [A004652](https://oeis.org/A004652), which is defined as:

$$
f(n) = -\frac{3}{8}(-1)^n + \frac{n^2}{4} + \frac{3}{8}
$$

However, the context of rotational symmetry in matrices — especially as framed here — is not yet documented in the OEIS for this sequence, nor is this specific function. This observation may be novel, and I plan to contribute a note or comment to OEIS soon to highlight this symmetry interpretation.