
clc
syms x ;
syms k ;
syms y ;
syms abs(F)
M = 2;%taking matrix of N*N size(N=2,3,4,10)
A=zeros(M);%matrix A with zero values
f=zeros(1,M);%vector f of 1*N size
Array3 = zeros(M);
for i=1:M%iteration to get matrix A and vector f
    %f = sin(i*pi*x);
    a1 = @(x) (i*pi*cos(i*pi*x)).*(i*pi*cos(i*pi*x));%defining function a1 for matrix A
    a2 = @(x) -(x.^12.*(sin(i*pi*x))) +  (3.*x.^11.*(sin(i*pi*x))) - (3.*x.^10.*(sin(i*pi*x)))+(x.^9.*(sin(i*pi*x)))+(12.*x.^2.*(sin(i*pi*x)))-(6.*x.*(sin(i*pi*x)));%defining function a2 vector f
    %a3 = @(x) (((symsum(y(k).*(sin(k*pi*x)),k,1,4))).^3).*(sin(i*pi*x));
    A(i,i) = integral(a1,0,1);%taking integration of a1 function with domain(0,1)
    f(i) = integral(a2,0,1);%taking integration of a2 function with domain(0,1)
end
A; 
f;

Array1 = 0;
syms y [1 M]
for k = 1:M
    fun = y(k)*sin(k*pi*x);
    Array1 = fun+Array1;
    n = (Array1.^3);
end


Array2=[];
for j = 1:M
        fun2=n.*sin(j.*pi.*x);
        Array2=[Array2 fun2];
end
N = Array2.'


Array3 = [];
num_rows = size(A,1);
num_cols = size(A,2);
for i=1:1:num_rows
    for j=1:1:num_cols
        a = diff(N(j),y(i));
        Array3 = [Array3 a];
    end   
end
ArrNd = reshape(Array3,M,M).';
Nd= int(ArrNd,0,1);
Nd

F = A*y.'+(N.')-f'
Fd = A+Nd

        
%Newton's method...
abs(F)=0; 
eps = 10^(-16);
y(k) = 0;
 while abs(F) > eps

        s = -F/Fd;
        y(k) = y(k) + s;
        %a = abs(F);
        i=i+1;
        
 end
 





 

