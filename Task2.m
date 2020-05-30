% https://octave-online.net <- Скрипт можно запустить тут или на личном ПК


% <===== Скрипт работает с пакетом Symbolic Math Toolbox =====> %


clear;
% Задаем переменные и функции
syms t c_0g(s_) c_01g(s_) c_2g(s_) ;
s = tf('s');
g = t^2;
W = (s+4)/(s*(s+3))

% Нашли R
R = (s+3)*(2*s+1)/(s*(s+4))

% Нашли W_eg
W_eg = 1/(1+W*R) % W_eg = s^2/(s+1)^2

% Нашли коэффициенты. Пока запишем в виде функций, а затем вызовем с
% параметром 0
c_0g(s_) = s_^2/(s_+1)^2 % W_eg(0) = 0
c_1g(s_) = s_/(s_+1)^2 % W_eg/s(0) = 0
c_2g(s_) = 1/(s_+1)^2 % W_eg/s^2(0) = 1

% Нашли ошибку
error_ = c_0g(0)*g + c_1g(0)*diff(g,2) + c_2g(0)*diff(g,2)

% Строим график
figure('position', [250, 250, 1000, 700]);
hold on;
grid on;
p2 = fplot(error_, [0, 10],'Linewidth',2);
p1 = fplot(g, [0, 10],'Linewidth',2);
legend('error','input');
title('Graph');
hold off;


return; % Останавливаю скрипт, дабы не запускался нижний


% <===== Скрипт работает БЕЗ пакета Symbolic Math Toolbox =====> %


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

% Строим график
figure('position', [250, 250, 1000, 700]);
plot(t, g, t, error_);
legend('input', 'error');
