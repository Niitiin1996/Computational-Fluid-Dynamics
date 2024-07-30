clear all
close all
clc

%To find a,b,c,d,e for FDS and BDS series.
syms a b c d e f
eqn1=a+b+c+d+e+f == 0;
eqn2=0+b+2*c+3*d+4*e+5*f == 0;
eqn3=0+b+4*c+9*d+16*e+25*f == 2;
eqn4=0+b+8*c+27*d+64*e+125*f == 0;
eqn5=0+b+16*c+81*d+256*e+625*f == 0;
eqn6=0+b+32*c+243*d+256*4*e+625*5*f ==0;    

var=[a,b,c,d,e,f];
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6],var);

Sol= single(linsolve(A,B));


%To fine a,b,c,d,e,f for CDS series
syms a1 b1 c1 d1 e1 f1

eqn1=a1+b1+c1+d1+e1 == 0;
eqn2=0-2*b1-c1+d1+2*e1 == 0;
eqn3=0+4*b1+c1+d1+4*e1== 2;
eqn4=0-8*b1-c1+d1+8*e1 == 0;
eqn5=0+16*b1+c1+d1+16*e1 == 0;

var=[a1,b1,c1,d1,e1];
[A1,B1] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5],var);


Sol1= single(linsolve(A1,B1));
x= pi/3;
dx= linspace(pi/50,pi/500,15);
for i = 1:length(dx)
    fds(i)= FDS(x,dx(i),Sol);
    bds(i)= BDS(x,dx(i),Sol);
    cds(i)= CDS(x,dx(i),Sol1);
   
    
end

%Plotting the Graph
figure(1)
loglog(dx,fds)
grid on
hold on
loglog(dx,bds,'r')
hold on

loglog(dx,cds,'g')
hold on
xlabel('dx')
ylabel('Error')
legend('FDS','BDS','CDS')

function out = FDS(x, dx, S)

Analytical= (-2)*sin(x)*exp(x);

fds = (S(1)*F(x)+S(2)*F(x+dx)+S(3)*F(x+2*dx)+S(4)*F(x+3*dx)+S(5)*F(x+4*dx)+S(6)*F(x+5*dx))/(dx^2);
out = abs(Analytical-fds);
end

function out = BDS(x, dx, S)

Analytical= (-2)*sin(x)*exp(x);

bds = (S(1)*F(x)+S(2)*F(x-dx)+S(3)*F(x-2*dx)+S(4)*F(x-3*dx)+S(5)*F(x-4*dx)+S(6)*F(x-5*dx))/(dx^2);
out = abs(Analytical-bds);
end

function out = CDS(x,dx,S)

Analytical= (-2)*sin(x)*exp(x);

cds = (S(1)*F(x)+S(2)*F(x-2*dx)+S(3)*F(x-dx)+S(4)*F(x+dx)+S(5)*F(x+2*dx))/(dx^2);

out = abs(Analytical-cds);

end

function out = F(x)

out=exp(x)*cos(x)
end