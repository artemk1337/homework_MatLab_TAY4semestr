slCharacterEncoding('UTF-8')
clear;
t = 0:0.01:10;

% ���� 
A = 4;
w = 5;
alpha = 0;
u = A*sin(w*t + alpha);

% ������������ �������
W = 3 / (-(w)^2 + 2*w*1i + 4);

% ��������� ��������� �������
B = round(abs(W) * A, 2);

% ���� ��������� �������
betta = round(alpha + angle(W), 2);

% ����� ������ �������
y = abs(W)*A*sin(w*t + alpha + angle(W));
% ���
y_ = B * sin(w*t + betta);


% ��� ���������� �������. ��� ��������, ���� �� ����� �� ������� ��������.
n = 0;
while (2*pi*n - min(alpha, betta) + pi/2) / w < 0
    n = n + 1;
end

% ����������
pick_u = (pi/2 - alpha + 2*pi*n)/w;
pick_y = (pi/2 - betta + 2*pi*n)/w;

% ������������� �������� �����.
shift_x = [pick_u, pick_y];
shift_y = [min(A, B), min(A, B)];



figure('position', [250, 250, 1000, 700]);

p = plot(t, u, t, y, shift_x, shift_y);
p(1).LineWidth = 2;
p(2).LineWidth = 2;
p(3).LineWidth = 6;
grid on;

% ������������ �����
xl1 = xline(pick_u, '-.','U pick');
xl2 = xline(pick_y, '-.','Y pick');
xl1.LabelVerticalAlignment = 'middle';
xl2.LabelVerticalAlignment = 'middle';
xl1.LabelHorizontalAlignment = 'center';
xl2.LabelHorizontalAlignment = 'center';

% �������
xlabel('time (seconds)');
ylabel('4sin5t');
legend('Asin(wt+alpha)', 'Bsin(wt+betta)', '��������');
