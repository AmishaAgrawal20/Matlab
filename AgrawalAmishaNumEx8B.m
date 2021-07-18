
clc
syms x ;
syms k ;
syms y ;
M=2; %(M=2,3,4,10)
A = zeros(M);%matrix a with zero values
f=zeros(1,M);%vector f of 1*M-1 size
for i=1:M
    for j=1:M
        f1 = @(x) x.^(j).*(1-x);%defining function f1 
        f2 = @(x) (x.^i).*(1-x);%defining function f2
        f3 = @(x) -(x.^12.*(x.^i).*(1-x)) +  (3.*x.^11.*(x.^i).*(1-x)) - (3.*x.^10.*(x.^i).*(1-x))+(x.^9.*(x.^i).*(1-x))+(12.*x.^2.*(x.^i).*(1-x))-(6.*x.*(x.^i).*(1-x));%defining function a2 vector f
        d1 = diff(f1,x);% now calculate the derivative of the function f1
        d2 = diff(f2,x);% now calculate the derivative of the function f2
        a1 =  d1*d2;
        A(i,j)  = int(a1,0,1);
        f(i)=int(f3(x),0,1);
    end
end
  
A; %matrix a
f;%vector f

Array1 = 0;
syms y [1 M]
for k = 1:M
    fun = y(k).*(x.^k).*(1-x);
    Array1 = fun+Array1;
    n = (Array1.^3);
end
Array2=[];
for j = 1:M
        fun2=n.*(x.^j).*(1-x);
        Array2=[Array2 fun2];
end
N= Array2.';


Array3 = [];
%num_rows = size(A,1);
%num_cols = size(A,2);
for i=1:M
    for j=1:M
        a = diff(N(j),y(i));
        Array3 = [Array3 a];
    end   
end
Nd = reshape(Array3,M,M).';
ArrNd = int(Nd,0,1);

%To find N"
%s=sym(zeros(M))
Array4 =[];
for i = 1:4
    
    for j = 1:M
        b = diff(Nd(i),y(j));
        Array4 = [Array4 b];
        
    end
    
end

Ndd= int(Array4,0,1)


%To find operator T(u)
Fd = A + ArrNd;
s = subs(Fd, {y1, y2}, {2, -1});
Fd_inv = inv(s);
I = eye(M); %Identity matrix of size M

T = [Fd_inv; I]  %concatinating Identity matrix and inverse of (A+Nd)


%finding adjoint vector P(P = inv(A + N'(y))*(y-yd)
yd = [1 1];
p = Fd_inv.*(y-yd);
P = subs(p, {y1, y2}, {2, -1})


 

