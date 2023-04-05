xi=0.9;
a=1;
sigma2=1;

N=1e4;
M=1e2;
%generate data
flag_raw=binornd(1,1-xi,[N,1]) * sigma2;
flag=repmat(flag_raw,1,M);
raw=randn(N,M);
data=raw + a*flag;
%2
signal1=data(:,1);
l1=xi/(1-xi);
threshold1=a/2+sigma2/a*log(l1);
pred1=(signal1>threshold1);
h1=flag(:,1);

acc1=sum(pred1==h1)/length(h1);
detect1=sum((pred1==1) .* (h1==1))/sum(h1);
w11=sum((pred1==1) .* (h1==0))/(length(h1)-sum(h1));
w21=sum((pred1==0) .* (h1==1))/length(h1);
err1=1-acc1;
%(1-normcdf(threshold1,0,sigma2))*xi
%(1-normcdf(threshold1,a,sigma2))*(1-xi)
%(1-normcdf(threshold1,0,sigma2))*xi + normcdf(threshold1,a,sigma2)*(1-xi)

%3
xx=[1:1:M];
count=repmat((1:1:M),N,1);
signal2=cumsum(data,2) ./ count;
threshold2=a/2+sigma2./xx/a*log(l1);
pred2=(signal2>threshold2);
h2=flag;

acc2=sum(pred2==h2,1)/size(h2,1);
w12=sum(((pred2==1) .* (h2==0)),1)/size(h2,1);
w22=sum(((pred2==0) .* (h2==1)),1)/size(h2,1);

%plot([1:1:M],1-acc2);
%ylabel('err');
%xlabel('number of sample')

%hold on;
%plot([1:1:M],0.9*(1-normcdf(threshold2,0,1./sqrt(xx)))+0.1*normcdf(threshold2,a,1./sqrt(xx)))
%legend('simulate','theoretical')

%4
c01=10;c10=100;c00=0;c11=0;
l3=xi*(c10-c00)/((1-xi)*(c01-c11));
threhold3=a/2+sigma2./xx/a*log(l3);
pred3=(signal2>threhold3);

cost_act=c10*sum(((pred3==1) .* (h2==0)),1)/size(h2,1) + c01*sum(((pred3==0) .* (h2==1)),1)/size(h2,1);
cost_the=(1-xi)*c01*(normcdf(threhold3,a,1./sqrt(xx)))+xi*c10*(1-normcdf(threhold3,0,1./sqrt(xx)));

%plot(xx,cost_act)
%hold on;
%plot(xx,cost_the)
%ylabel('cost');
%xlabel('number of sample')
%legend('simulate','theoretical')

%5
MM=1e3;
l4=linspace(1,100,MM);
signal4=signal2(:,M);
test=(signal4.^2) * M;

h4=flag(:,M);
threhold4=repmat(2 * sigma2 * log(l4),N,1);

pred4=((signal4.^2) * M > threhold4);
h4=repmat(flag_raw,1,MM);

pd4=sum(((pred4==1) .* (h4==1)),1)/sum(h1);
pf4=sum(((pred4==1) .* (h4==0)),1)/(length(h1)-sum(h1));
plot(pf4,pd4);
xlabel('PF');
ylabel('PD');

%6
alpha=0.1;beta=0.1;
lambda1=(1-beta)/alpha;
lambda0=beta/(1-alpha);
threhold51=log(lambda1);
threhold50=log(lambda0);
signal5=cumsum(data,2) - count./2;

pred5 = (signal5>threhold51) | (signal5<threhold50);
[temp,index] = max(pred5,[],2);
avg = sum(index)/length(index)
the = (beta*log(lambda0)+(1-beta)*log(lambda1));








