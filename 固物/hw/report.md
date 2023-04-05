#                 固体物理基础大作业 能带计算<br>实验报告
<center><div style='height:2mm;'></div><div style="font-family:华文楷体;font-size:14pt;">2020010636 无01 尧乐彬</div></center>
<center><span style="font-family:华文楷体;font-size:11pt;line-height:6mm">yaolb20@mails.tsinghua.edu.cn<br>
    2023.03.29</span></center>

## 绘制势能分布曲线


按照要求，根据 $V(x)$ 的表达式绘制势能分布曲线**图1**所示。

<img width=500 src="./fig1.png" >

<center><strong>图1 势能分布曲线图</strong></center>

## 特征根法求解能带曲线
### 理论基础

记 $V=1\times10^{-19}J$，对 $V(x)$ 进行 Fourier 展开，得展开系数为
$$
V_n=\frac{1}{a}\int_{-\frac{a}{2}}^{\frac{a}{2}}V(x)e^{-j\frac{2n\pi}{a}x}dx=\begin{cases}
-\frac{cos(\frac{n\pi}{2})V_a}{(n^2-1)\pi}&n\neq\pm1\\
\frac{1}{4}V&n=\pm1\\\end{cases}
$$
由于 MATLAB 无法处理无穷项的 $V_n$，将 $V(x)$ 的 Fourier 级数截断至前 $2m+1$ 项（即对 $|n|>m$ 的 $V_n$ 置零），得
$$
V(x)\approx\sum_{n=-m}^{m}V_ne^{j\frac{2n\pi}{a}x}
$$
相应地，特征根方法求解过程中 $E$ 与 $k$ 满足的方程截断为
$$
det(\begin{bmatrix}
\frac{\hbar^2}{2m_0}(k+\frac{2(-m)\pi}{a})^2+V_0-E&V_{-1}&\cdots&V_{-m}&\cdots&V_{-2m}\\
V_{1}&\frac{\hbar^2}{2m_0}(k+\frac{2(-m+1)\pi}{a})^2+V_0-E&\cdots&V_{-m+1}&\cdots&V_{-2m+1}\\
\vdots&\vdots&\ddots&\vdots&\ddots&\vdots\\
V_{2m}&V_{2m-1}&\cdots&V_m&\cdots&\frac{\hbar^2}{2m_0}(k+\frac{2m\pi}{a})^2+V_0-E
\end{bmatrix})=0
$$
在实际求解时，可通过对于每个 $k$ 求矩阵特征值直接得到 $E$。计算时取了 $m=100$。

### 计算与绘图结果

使用特征根法绘制的前 4 条能带曲线如**图2**所示。带隙为
$$
\Delta E_1=4.9340\times10^{-20}J\\\Delta E_2=2.2723\times10^{-20}J\\\Delta E_3=7.2437\times10^{-22}J
$$
<img width=500 src="./fig2.png" >

<center><strong>图2 特征根法绘制的前 4 条能带曲线</strong></center>

## 近自由电子近似求解能带曲线

### 理论基础

根据近自由电子近似方法，在布里渊区边界处有近似公式
$$
E_{\pm}=V_0+T_n\pm|V_n|\pm\Delta^2T_n(\frac{2T_n}{|V_n|}\pm1)
$$
其中 $T_n=\frac{\hbar^2}{2m_0}(\frac{\pi n}{a})^2$，$k=-\frac{\pi n}{a}(1-\Delta)$，$k^{'}=\frac{\pi n}{a}(1+\Delta)$，据此得带隙宽度为 $2|V_n|$。

### 计算与绘图结果

使用近自由电子近似计算的带隙为
$$
\Delta E_1=5.0000\times10^{-20}J\\\Delta E_2=2.1221\times10^{-20}J\\\Delta E_3=0J
$$
在布里渊区边界附近 $\Delta k=\pm\frac{1}{10}\frac{2\pi}{a}$，使用两种方法绘制的能带曲线如**图3**、**图4**、**图5**所示（注：**图5**中没有绘出使用近自由电子近似得到的能带曲线是因为 $|V_3|=0$，无法使用近似公式）。

<img width=500 src="./fig3.png" >

<center><strong>图3 第一个带隙附近的能带曲线</strong></center>

<img width=500 src="./fig4.png" >

<center><strong>图4 第二个带隙附近的能带曲线</strong></center>

<img width=500 src="./fig5.png" >

<center><strong>图5 第三个带隙附近的能带曲线</strong></center>

### 与特征根法的结果对比分析

近自由电子近似与特征根法得到的带隙较接近，这说明了两种方法的合理性与计算的正确性。以近自由电子近似得到的理论值作为真值，特征根法计算存在误差可能是由于特征根法计算过程中对 $V(x)$ 做了截断，且数值计算天然存在量化误差。

对比能带曲线，可以发现两种方法在接近布里渊区边界时符合得较好，而远离布里渊区边界时则相差较远。这是因为近自由电子近似给出的经验公式依赖于 $|E_k^0-E_{k^{'}}^0|\ll|V_n|$，在远离布里渊区边界时近似不再成立。