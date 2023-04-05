import numpy as np
import matplotlib.pyplot as plt

v0=1e-19
a=5.43e-10
x=np.linspace(-a/2,a/2,1000)
interval0=[1 if(i>-a/4 and i<a/4) else 0 for i in x]
y=v0*np.cos(2*np.pi*x/a) * interval0
plt.xlabel('x/m')
plt.ylabel('V(x)/J')
plt.plot(x,y)
plt.show()

