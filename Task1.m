slCharacterEncoding('UTF-8')
clear;
t = 0:0.01:10;

% Дано 
A = 4;
w = 5;
alpha = 0;
u = A*sin(w*t + alpha);

% Передаточная функция
W = 3 / (-(w)^2 + 2*w*1i + 4);

% Амплитуда выходного сигнала
B = round(abs(W) * A, 2);

% Фаза выходного сигнала
betta = round(alpha + angle(W), 2);

% Поиск нового сигнала
y = abs(W)*A*sin(w*t + alpha + angle(W));
% или
y_ = B * sin(w*t + betta);


% Для построения графика. Ищу смещение, дабы не выйти за пределы картинки.
n = 0;
while (2*pi*n - min(alpha, betta) + pi/2) / w < 0
    n = n + 1;
end

% Экстремумы
pick_u = (pi/2 - alpha + 2*pi*n)/w;
pick_y = (pi/2 - betta + 2*pi*n)/w;

% Относительное смещение пиков.
shift_x = [pick_u, pick_y];
shift_y = [min(A, B), min(A, B)];



figure('position', [250, 250, 1000, 700]);

p = plot(t, u, t, y, shift_x, shift_y);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 6;
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
legend('Asin(wt+alpha)', 'Bsin(wt+betta)', 'Смещение');
