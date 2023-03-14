## lec2 Single-Parameter Models

likelihood: $p(y|\theta)\propto\theta^y(1-\theta)^{n-y}$

Prior: $p(\theta)\propto 1\Rightarrow\theta\sim u(0,1)$

Posterior: $p(\theta|y)\propto\theta^y(1-\theta)^{n-y}\Rightarrow\theta|y\sim Beta(y+1,n-y+1)$



Prior(Conjugate Prior): $p(\theta)\propto \theta^{\alpha-1}(1-\theta)^{\beta-1}\Rightarrow\theta\sim Beta(\alpha,\beta)$ (#pre=$\alpha+\beta-2$)

Posterior: $p(\theta|y)\propto\theta^{y+\alpha-1}(1-\theta)^{n-y+\beta-1}\Rightarrow\theta|y\sim Beta(\alpha+y,\beta+n-y)$

**Conjugate Prior**: 

![image-20230228155655075](C:\Users\randommm\AppData\Roaming\Typora\typora-user-images\image-20230228155655075.png)


$$
E(\theta)=E[E[\theta|Y]]\\
Var[\theta]=E[Var[\theta|Y]]+Var[E[\theta|Y]]
$$


likelihood: $p(y|\theta)=\prod_{i=1}^{n}\dfrac{1}{y_i!}\theta^{y_i}e^{-\theta}\propto \theta^{n\bar y}e^{-n\theta}$

Conjugate Prior: $p(\theta)\propto \theta^{\alpha-1}e^{-\beta\theta}\sim Gamma(\alpha,\beta)$

Posterior: $p(\theta|y)\sim Gamma(\alpha+n\bar y,\beta+n)$



