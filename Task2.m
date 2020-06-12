clear;
% Задаем переменные и функции
t = 0:0.01:10;
s = tf('s');
g = t.^2;
W = (s+4)/(s*(s+3));

% Нашли R
R = (s+3)*(2*s+1)/(s*(s+4));

W_eg = 1/(1+W*R); % W_eg = s^2/(s+1)^2

% Нашли коэффициенты
c_0g = 0; % W_eg(0) = 0
c_1g = 0; % W_eg/s(0) = 0
c_2g = 1; % W_eg/s^2(0) = 1

% Нашли ошибку
error_ = c_0g*g + c_1g*(2*t) + c_2g*2;
e_g = lsim(W_eg, g, t);

% Строим график
figure('position', [250, 250, 1000, 700]);
p = plot(t, g, t, e_g');
p(1).LineWidth = 2;
p(2).LineWidth = 2;
legend('input', 'error');
grid on;

