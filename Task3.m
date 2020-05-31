clear;
s = tf ('s');
g = 1;

alpha = 0.1
q = s;
% Подборка коэффициента
calculate(alpha, q, 0);
% Конечный результат после подбора коэффициента
calculate(alpha, q*alpha, 200);


function calculate(alpha, q, shift_)
global g
    W_yg = (2*q+1)/(q^2+2*q+1);
    [y,t] = step(W_yg, 10);
    step_info = stepinfo(W_yg,'SettlingTimeThreshold', 0.05);
    tau_r = step_info.SettlingTime
    t_r = alpha * tau_r

    W = 1/(q^2+2*q+1);
    [y_table,t] = step(W, 10);
    step_info_table = stepinfo(W,'SettlingTimeThreshold', 0.05);
    tau_r_table = step_info_table.SettlingTime
    t_r_table = alpha * tau_r_table

    % График
    figure('position', [250+shift_, 250, 1000+shift_, 700]);
    hold on;

    plot(t, squeeze(y), t, squeeze(y_table), 'LineWidth', 2), grid;
    xline(tau_r, '-.b', 'Linewidth', 1);
    xline(tau_r_table, '-.re', 'Linewidth', 1);
    yline(g - 0.05*g);
    yline(g + 0.05*g);
    plot(tau_r, 1 + 0.05*1, 'oblack', 'Linewidth', 3);
    plot(tau_r_table, 1 - 0.05*1, 'oblack', 'Linewidth', 3);

    xlabel('time (seconds)');
    ylabel('Amplitude');
    title('System reaction');
    legend('W_{yg}','W_{table}','SettlingTime','SettlingTime');

    hold off;
end


