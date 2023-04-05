

### HW4

#### 5.10

##### a)

$$
p(\tau|y)\propto p(\tau)V_\mu^{1/2}\prod_{j=1}^J(\sigma_j^2+\tau^2)^{-1/2}\exp{(-\dfrac{(\bar y_{.j}-\hat\mu)^2}{2(\sigma_j^2+\tau^2)})}
$$

if $p(\tau)\propto \tau^{-1}$, when $\tau\to 0$, $p(\tau)\to\infty$ while $p(\tau|y)/p(\tau)\to C>0$, so $\int_{0}^{\infty}p(\tau|y)d\tau\to \infty$, so the posterior density is improper

##### b)

$$
p(\tau|y)\propto V_\mu^{1/2}\prod_{j=1}^J(\sigma_j^2+\tau^2)^{-1/2}\exp{(-\dfrac{(\bar y_{.j}-\hat\mu)^2}{2(\sigma_j^2+\tau^2)})}\leq V_\mu^{1/2}\prod_{j=1}^J(\sigma_j^2+\tau^2)^{-1/2}\\
V_\mu^{1/2}\prod_{j=1}^J(\sigma_j^2+\tau^2)^{-1/2}=(\sum_j\prod_{k\neq j}(\sigma_k^2+\tau^2))^{-1/2}\leq J^{1/2}\tau^{1-J}
$$

when J>2, $p(\tau|y)\to0$ when $\tau\to \infty$,  and in a) we find that $p(\tau|y)/p(\tau)\to C>0$, so $\int_{0}^{\infty}p(\tau|y)d\tau< \infty$, the posterior is proper.

#### 5.12

$$
E(\theta_j|\tau,y)=E[E[\theta_j|\mu,\tau,y]|\tau,y]=E[\dfrac{y_j/\sigma_j^2+\mu/\tau^2}{1/\sigma_j^2+1/\tau^2}|\tau,y]=\dfrac{y_j/\sigma_j^2+\hat\mu/\tau^2}{1/\sigma_j^2+1/\tau^2},\hat\mu=E[\mu|\tau,y]\\
Var[\theta_j|\tau,y]=E[Var[\theta_j|\mu,\tau,y]|\tau,y] + Var[E[\theta_j|\mu,\tau,y]|\tau,y]=\dfrac{1}{1/\sigma_j^2+1/\tau^2}+(\dfrac{1/\tau^2}{1/\sigma_j^2+1/\tau^2})^2V_\mu,V_\mu=Var[\mu|\tau,y]
$$

#### 5.13

 ##### a)

$$
p(\theta,\alpha,\beta|y)=p(\alpha,\beta)\prod p(\theta_j|\alpha,\beta)p(y|\theta_j)=(\alpha+\beta)^{-5/2}\prod_{j=1}^{10}\dfrac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)}\theta_j^{y_j+\alpha-1}(1-\theta_j)^{n_j-y_j+\beta-1}
$$

##### b)

$$
p(\alpha,\beta|y)=(\alpha+\beta)^{-5/2}\prod_{j=1}^{10}\dfrac{\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\beta)}\dfrac{\Gamma(\alpha+y_j)\Gamma(\beta+n_j-y_j)}{\Gamma(\alpha+\beta+n_j)}
$$

##### c)

