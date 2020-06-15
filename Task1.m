clear;
t = 0:0.01:10;


s = tf('s');
% Передаточная функция
Ws = (1 / (s ^ 2 + s + 1));


A = 4;
w = 5;
alpha = 0;
u = A*sin(w*t + alpha);

% Передаточная функция
W = 3 / ((w*1i)^2 + 2*w*1i + 4);
Aw = abs(W);
FIw = round(-pi + atan(imag(W)/real(W)), 2) % fi
% Без явного округления MatLab все равно не выдает более 3 знаков после
% точки

B = round(Aw * A, 2) % Амплитуда выходного сигнала

betta = round(alpha + angle(W), 2); % Фаза выходного сигнала

y = lsim(Ws, u, t);

% Экстремумы
pick_u = (pi/2 - alpha)/w;
pick_y = (pi/2 - betta)/w;

% Относительное смещение пиков.
shift_x = [pick_u, pick_y];
shift_y = [min(A, B), min(A, B)];

% Основной график
figure('position', [250, 250, 1000, 700]);

p = plot(t, u, t, y, shift_x, shift_y);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 4;
grid on;

% Вертикальные линии
xl1 = xline(pick_u, '-.','U pick');
xl2 = xline(pick_y, '-.','Y pick');
xl1.LabelVerticalAlignment = 'middle';
xl2.LabelVerticalAlignment = 'middle';
xl1.LabelHorizontalAlignment = 'center';
xl2.LabelHorizontalAlignment = 'center';

% Подписи
xlabel('time (seconds)');
ylabel('4sin5t');
legend('Asin(wt+alpha)', 'System reaction', 'Shift');
