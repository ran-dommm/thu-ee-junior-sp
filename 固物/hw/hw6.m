v0=1e-19;
a=5.43e-10;
x=linspace(-a/2,a/2,1000);
interval0=(x>-a/4) & (x<a/4);
y=v0*cos(2*pi*x/a) .* interval0;
%plot(x,y)
%ylim([-v0/9 10/9*v0]);
%xlabel('x/m');
%ylabel('V(x)/J');

m=100;
n=[-2*m:1:2*m];
vn=-cos(n*pi/2)*v0./(n.^2-1)/pi;
vn(2*m)=v0/4;
vn(2*m+2)=v0/4;

h=6.63e-34;
m0=9.1e-31;
E=[];
for k = linspace(-pi/a,pi/a,100)
    mat=vn(2*m+1:-1:1);
    mat(1) = mat(1) + h^2/2/m0/4/(pi^2)*(k+2*(-m)*pi/a)^2;
    for i=1:2*m
        row=vn(2*m+1+i:-1:1+i);
        row(i+1) = row(i+1) + h^2/2/m0/4/(pi^2)*(k+2*(-m+i)*pi/a)^2;
        mat=[mat;row];
    end
    e=sort(eig(mat));
    E=[E,e];
end
k = linspace(-pi/a,pi/a,100);
%plot(k,E(1:4,:));
%min(E(4,:)-E(3,:)); %特征根带隙计算
%title('特征根求解简约布里渊区前4条能带')
%xlabel('k/m-1');
%ylabel('E/J');
%legend('E1','E2','E3','E4');

%2*vn(2*m+4)%自由电子带隙计算


delta=linspace(-1/10,1/10,100);
n=2;
tn=h^2/2/m0/4/(pi^2)*(pi*n/a)^2;
Ep=vn(2*m+1)+tn+abs(vn(2*m+n+1))+delta.^2*tn*(2*tn/abs(vn(2*m+n+1))+1);
En=vn(2*m+1)+tn-abs(vn(2*m+n+1))-delta.^2*tn*(2*tn/abs(vn(2*m+n+1))-1);
Ee=[Ep;En];
p1=plot(delta*pi/a,Ee,Color='r');
hold on;
p2=plot(k(45+1:45+11),E(2:3,45+1:45+11),Color='b');
xlabel('k/m-1');
ylabel('E/J');
title('带隙对比n=2')




