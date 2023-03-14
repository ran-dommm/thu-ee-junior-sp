clc; clear all; close all;

%% 训练模型
n_max = 10;
N_min = 2;  % min of N = 10^N_min
N_max = 6;  % max of N = 10^N_max
lambda_max = 10000;
J = zeros(n_max, N_max-N_min+1);
w = cell(n_max, N_max-N_min+1);

% 对n与N的不同取值进行最小二乘估计
for n = 1:n_max
    for N = logspace(N_min, N_max, N_max-N_min+1)
        % 生成随机数并预处理数据
        lambda = lambda_max*rand(N, 3);
        [alpha, beta, p] = pre_proccess(lambda);
        % 计算观测矩阵Q与结果矩阵H
        [Q, H] = get_Q_H(p, alpha, beta, n, N);
        % 最小二乘估计系数矩阵w 并计算误差函数值
        w{n, log10(N)-N_min+1} = (Q'*Q)\Q'*H;  % 等价于inv(Q'*Q)*Q'*H
        J(n, log10(N)-N_min+1) = get_loss(w{n, log10(N)-N_min+1}, lambda_max, n);
    end
end

%% 作图
figure;
for n = 1:n_max/2
    loglog(logspace(N_min, N_max, N_max-N_min+1), J(n, :), 'linewidth', 1.5); hold on;
end
for n = (n_max/2+1):n_max
    loglog(logspace(N_min, N_max, N_max-N_min+1), J(n, :), '-.', 'linewidth', 1.5); hold on;
end
legend(strcat("n = ", num2str((1:n_max)')));
xlabel("N"); ylabel("RMSE");
ylim([min(J(:))*0.5, max(J(:))*2]);

%% 保存模型参数
w0 = w{9, 5-N_min+1};
save weight.mat w0

%% 作出模型的预测-真值曲线
n = 9;
N = 10^6;
lambda = lambda_max*rand(N, 3);
[alpha, beta, p] = pre_proccess(lambda);
[Q, H_real] = get_Q_H(p, alpha, beta, n, N);
H_pred = Q*w0;
RMSE0 = norm(H_pred - H_real) / sqrt(N);
figure;
plot(0:0.01:1, 0:0.01:1, 'linewidth', 1);  hold on;
scatter(H_real, H_pred, 3, 'filled');
legend('y = x', 'H\_pred ~ H\_real');
xlabel('H\_real');  ylabel('H\_pred');
xlim([0, 1]);  ylim([0, 1]);
title(strcat("RMSE = ", num2str(RMSE0)));

%%
function [alpha, beta, p] = pre_proccess(lambda) % 由随机生成的lambda计算参数
    a = -sum(lambda, 2);
    b = sum(lambda .* lambda(:, [2,3,1]), 2);
    c = -prod(lambda, 2);
    alpha = b./(a.^2);
    beta = c./(a.^3);
    p = -lambda ./ repmat(a, 1, 3);
end

function [Q, H] = get_Q_H(p, alpha, beta, n, N) % 由参数计算观测矩阵Q与结果矩阵H
    H = -sum(p.*log(p)/log(3), 2);
    Q = zeros(N, (n+1)*(n+2)/2);
    cnt = 1;
    for i = 0:n
        for j = 0:i
            Q(:, cnt) = alpha.^(i-j) .* beta.^j;
            cnt = cnt+1;
        end
    end
end

function RMSE = get_loss(w, lambda_max, n)  % 计算RMSE
    N = 10^6;
    lambda = lambda_max*rand(N, 3);
    [alpha, beta, p] = pre_proccess(lambda);
    [Q, H] = get_Q_H(p, alpha, beta, n, N);
    RMSE = norm(H - Q*w) / sqrt(N);
end
