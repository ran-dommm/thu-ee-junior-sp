from scipy.stats import norm
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import fsolve


plt.figure()
# alist=[0.01,0.05,0.1,0.3,0.5,0.8]
# snr=np.logspace(-10,10,100)

# for a in alist:
#     y=[]
#     for s in snr:
#         pd = 1-norm.cdf(norm.ppf(1-a)-s)
#         y.append(pd)
#     plt.semilogx(snr,y,label='alpha={}'.format(a))

# plt.legend()
# plt.xlabel('SNR')
# plt.ylabel('Pd')


xii=np.linspace(0,1,1000)
a=3
y=[]
for xi in xii:
    vt=1.5-1/3*np.log(11*(1-xi)/xi)
    y.append(xi*norm.cdf(vt) + 10*xi*(1-norm.cdf(vt)) + 100*(1-xi)*norm.cdf(vt-a) + (1-xi)*(1-norm.cdf(vt-a)))
ymax_idx = np.argmax(y)
plt.text(xii[ymax_idx],y[ymax_idx], '[{:.3f},{:.3f}]'.format(xii[ymax_idx],y[ymax_idx]))
plt.plot(xii,y)
plt.xlabel('xi')
plt.ylabel('Cmin')
plt.show()

# def func1(x):
#     return 11*(1-norm.cdf(x-3)) + (1-norm.cdf(x)) -11

# root1 = fsolve(func1, [1])

# def func2(x):
#     return 1.5-1/3*np.log(11*(1-x)/x) -root1

# root2=fsolve(func2, [0.5])
# print(root2)

a=0.05
n=10
m0=180
ybar=150
s0=40*40
s=20*20
mn=(m0/s0+n*ybar/s)/(1/s0+n/s)
sn=1/(1/s0+n/s)
ssn=sn+s

print(norm.ppf(1-a/2)*np.sqrt(ssn))
print(1.96*6.25)