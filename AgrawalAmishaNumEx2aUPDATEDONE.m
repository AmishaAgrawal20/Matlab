
clc
syms x ;
N = 10;%taking matrix of N*N size(N=2,3,4,5,10,20)
A=zeros(N);%matrix A with zero values
f=zeros(1,N);%vector f of 1*N size
for i=1:N%iteration to get matrix A and vector f
    %f = sin(i*pi*x);
    a1 = @(x) (i*pi*cos(i*pi*x)).*(i*pi*cos(i*pi*x));%defining function a1 for matrix A
    a2 = @(x) (12.*x.^2).*(sin(i*pi*x)) -  (6.*x.*(sin(i*pi*x)));%defining function a2 vector f
    A(i,i) = integral(a1,0,1);%taking integration of a1 function with domain(0,1)
    f(i) = integral(a2,0,1);%taking integration of a2 function with domain(0,1)
end
A  
f
%real_f = [(6*pi^2-48)/(pi^3),-3/pi,(18*pi^2-16)/(9*pi^3),-3/(2*pi)] 
y = inv(A)*f'  %y is the solution
%y=-1:0:0.5:1

    
Array=[];%creating an array to get componentwise multiplication of y and sin(i*pi*x)
for i=1:N
    term =y(i)*sin(i*pi*x);
    Array=[Array term];
end

y1=(sum(Array));
y1%to get an equation of y(x)
x=(0:0.01:1);
graph=subs(y1);
plot(x,graph);
grid on






 

