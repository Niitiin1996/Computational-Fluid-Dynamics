Problem Statement: Derivation of Central difference, Skewed right-sided difference, and Skewed left-sided difference for 4th-order approximations of the second-order derivative.

Also, a program in Matlab to evaluate the second-order derivative of the analytical function exp(x)*cos(x) and compare it with the 3 numerical approximations.

a. Providing a plot that compares the absolute error between the schemes mentioned above

b. Describe why a skewed scheme is useful. What can a skewed scheme do that a CD scheme cannot do? 

Theory: The main point is to understand the derivation of skewed and central difference schemes. For skewed difference, the points selected are the sum of the order of derivative (p) and the order of error approximation i.e. 6 ( 2(p) +4(q)) but for the central difference scheme, it is one less that it, i.e. 5(2(p)+4(q)-1. Therefore, 6 terms for skewed and 5 terms for central difference scheme is to be taken.

1) Skewed Right-Sided Difference: 

Let us assume;

∂2f/∂x2= a*f(i) + b*f(i + 1) + c*f(i + 2) + d* f(i + 3) + e* f(i + 4) + f* f(i + 5)

Where;

f(i + 1) =f(i) + ∆x*f’(x) + ∆x2/2!  *f’’(x) + ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) + ………

f(i + 2) =f(i) + 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) +8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) + ………

f(i + 3) =f(i) + 3*∆x*f’(x) +9* ∆x2/2!  *f’’(x) + 27*∆x3/3!  *f’’’(x) + 81*∆x4/4!  *f’’’’(x) + ………

f(i + 4) =f(i) + 4*∆x*f’(x) +16* ∆x2/2!  *f’’(x) + 64*∆x3/3!  *f’’’(x) + 256*∆x4/4!  *f’’’’(x) + ………

f(i + 5) =f(i) + 5*∆x*f’(x) +25* ∆x2/2!  *f’’(x) + 125*∆x3/3!  *f’’’(x) + 625*∆x4/4!  *f’’’’(x) + ………

Therefore;

∂2f/∂x2= a*f(i) + b*(  f(i) + ∆x*f’(x) + ∆x2/2!  *f’’(x) + ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) + ..) + c*(  f(i) + 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) +8* ∆x3/3! *f’’’(x) +16* ∆x4/4!  *f’’’’(x) + …) + d*( f(i) + 3*∆x*f’(x) +9* ∆x2/2!  *f’’(x) + 27*∆x3/3!  *f’’’(x) + 81*∆x4/4!  *f’’’’(x) + ..) + e*( f(i) + 4*∆x*f’(x) +16* ∆x2/2!  *f’’(x) + 64*∆x3/3!  *f’’’(x) + 256*∆x4/4!  *f’’’’(x) + …) + f*( f(i) + 5*∆x*f’(x) +25* ∆x2/2!  *f’’(x) + 125*∆x3/3!  *f’’’(x) + 625*∆x4/4!  *f’’’’(x) + ..)

∂2f/∂x2= (a+b+c+d+e+f)*f(i) + (b+2*c+3*d+4*e+5*f) *∆x*f’(x) + (b+4*c+9*d+16*e+25*f)* ∆x2/2!  *f’’(x) + (b+8*c+27*d+64*e+125*f)* ∆x3/3!  *f’’’(x) + (b+16*c+81*d+256*e+625*f) *∆x4/4!  *f’’’’(x)………..

We also know that;

a+b+c+d+e+f = 0

(b+2*c+3*d+4*e+5*f) *∆x =0

(b+4*c+9*d+16*e+25*f)* ∆x2/2! = 1

(b+8*c+27*d+64*e+125*f)* ∆x3/3! = 0

(b+16*c+81*d+256*e+625*f) *∆x4/4! = 0

Solving this we get;

a = 3.75/∆x2

b = -12.83/∆x2

c = 17.83/∆x2

d =-13/∆x2

e= 5.08/∆x2

f = -0.83/∆x2

2) Skewed Left-Sided Difference

Let us assume;

∂2f/∂x2= a*f(i) + b*f(i - 1)  + c*f(i - 2) + d* f(i - 3) + e* f(i - 4) + f* f(i - 5)

Where;

f(i -1) =f(i) - ∆x*f’(x) + ∆x2/2!  *f’’(x) - ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) - ………

f(i - 2) =f(i) - 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) -8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) -………

f(i - 3) =f(i) - 3*∆x*f’(x) +9* ∆x2/2!  *f’’(x) - 27*∆x3/3!  *f’’’(x) + 81*∆x4/4!  *f’’’’(x) - ………

f(i - 4) =f(i) - 4*∆x*f’(x) +16* ∆x2/2!  *f’’(x) - 64*∆x3/3!  *f’’’(x) + 256*∆x4/4!  *f’’’’(x) - ………

f(i - 5) =f(i) - 5*∆x*f’(x) +25* ∆x2/2!  *f’’(x) - 125*∆x3/3!  *f’’’(x) + 625*∆x4/4!  *f’’’’(x) - ………

and so

∂2f/∂x2 = a*f(i) + b*(  f(i) - ∆x*f’(x) + ∆x2/2!  *f’’(x) - ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) - ..) + c*(  f(i) - 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) -8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) - …) + d*( f(i) - 3*∆x*f’(x) +9* ∆x2/2!  *f’’(x) - 27*∆x3/3!  *f’’’(x) + 81*∆x4/4!  *f’’’’(x) -..)  + e*( f(i) - 4*∆x*f’(x) +16* ∆x2/2!  *f’’(x) - 64*∆x3/3!  *f’’’(x) + 256*∆x4/4!  *f’’’’(x) -  …) + f*( f(i) - 5*∆x*f’(x) +25* ∆x2/2!  *f’’(x) - 125*∆x3/3!  *f’’’(x) + 625*∆x4/4!  *f’’’’(x) -  ..)

∂2f/∂x2 = (a+b+c+d+e+f)*f(i) - (b+2*c+3*d+4*e+5*f) *∆x*f’(x) + (b+4*c+9*d+16*e+25*f)* ∆x2/2!  *f’’(x) -(b+8*c+27*d+64*e+125*f)* ∆x3/3!  *f’’’(x) - (b+16*c+81*d+256*e+625*f) *∆x4/4!  *f’’’’(x)………..

We also know that;

a+b+c+d+e+f = 0

(b+2*c+3*d+4*e+5*f) *∆x =0

(b+4*c+9*d+16*e+25*f)* ∆x2/2! = 1

(b+8*c+27*d+64*e+125*f)* ∆x3/3! = 0

(b+16*c+81*d+256*e+625*f) *∆x4/4! = 0

Solving this we get;

a = 3.75/∆x2

b = -12.83/∆x2

c = 17.83/∆x2

d =-13/∆x2

e= 5.08/∆x2

f = -0.83/∆x2

3) Central Difference :

Let us assume;

∂2f/∂x2 = a*f(i) + b*f(i - 2)  + c*f(i – 1) + d* f(i +1) + e* f(i +2)

Where;

f(i - 2) =f(i) - 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) -8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) -………

f(i -1) =f(i) - ∆x*f’(x) + ∆x2/2!  *f’’(x) - ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) - ………

f(i + 1) =f(i) + ∆x*f’(x) + ∆x2/2!  *f’’(x) + ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) + ………

f(i + 2) =f(i) + 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) +8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) + ………

and so

∂2f/∂x2 = a*f(i) + b*(  f(i) - 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) -8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) -.) + c*(  f(i) - ∆x*f’(x) + ∆x2/2!  *f’’(x) - ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) - …) + d*( f(i) + ∆x*f’(x) + ∆x2/2!  *f’’(x) + ∆x3/3!  *f’’’(x) + ∆x4/4!  *f’’’’(x) +..)  + e*( f(i) + 2*∆x*f’(x) + 4*∆x2/2!  *f’’(x) +8* ∆x3/3!  *f’’’(x) +16* ∆x4/4!  *f’’’’(x) + …)

∂2f/∂x2 = (a+b+c+d+e)*f(i) - (-2*b-c+d+2*e) *∆x*f’(x) + (4*b+c+d+4*e)*∆x2/2! *f’’(x) -(-8*b-c+d+8*e)* ∆x3/3!  *f’’’(x) - (16*b+c+d+16*e) *∆x4/4!  *f’’’’(x)………..

We also know that;

a+b+c+d+e+f = 0

(-2*b-c+d+2*e) *∆x = 0;

(4*b+c+d+4*e)*∆x2/2! = 2;

(-8*b-c+d+8*e)* ∆x3/3!  = 0;

(16*b+c+d+16*e) *∆x4/4! = 0

Solving this we get;

a = -2.5/∆x2

b = -0.083/∆x2

c = 1.33/∆x2

d = 1.33/∆x2

e = -0.083/∆x2


The usefulness of Skewed Scheme:
From the graph, it can be noticed that CDS is more accurate than FDS/ BDS, that may be because it used the same no. of iteration on both sides os central points. The central difference scheme is second order in h">h, whereas the other two are first order in h">h. Thus at fixed sufficiently small h">h, the central difference will have a better error than the other two.
But Central Difference lacks in providing Boundedness in several systems (when peclet number > 2, flow is not unidirectional) whereas Skewed System is unconditionally bounded and highly stable in these systems.
