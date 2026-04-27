% Підготовка навчальних даних
X = [-1.0  1.0  -1.0  1.0  -1.0  1.0  -1.0  1.0;
     -1.0 -1.0   1.0  1.0  -1.0 -1.0   1.0  1.0;
     -1.0 -1.0  -1.0 -1.0   1.0  1.0   1.0  1.0];

T = [0  1  0  0  1  1  0  1];

% Формування персептрона
% newp(PR, S) де PR — межі входів [min max] для кожної ознаки
PR = [-1 1; -1 1; -1 1];  % межі для 3 ознак
net = newp(PR, 1);         % 1 нейрон

% Ініціалізація
net = init(net);
net.trainParam.epochs = 1000;

% Навчання
net = train(net, X, T);

% Тестування
Y = net(X);
fprintf('Очікувані: '); disp(T)
fprintf('Отримані:  '); disp(Y)
fprintf('Помилок: %d\n', sum(Y ~= T));

%% Перевірка точок
% Отримуємо ваги та зсув з навченої мережі
W = net.IW{1,1}; % Вектор ваг (1x3)
b = net.b{1};    % Зсув (скаляр)

% Норма вектора ваг
norm_W = norm(W);

% Допуск для порівняння з нулем
tolerance = 1e-5; 

% Масив точок для перевірки
points_to_check = X; 

fprintf('\n--- Аналіз розташування точок ---\n');
for i = 1:size(points_to_check, 2)
    pt = points_to_check(:, i);
    
    % Формула відстані від точки до площини
    distance = abs(W * pt + b) / norm_W;
    
    % Перевірка та текстовий висновок
    if distance <= tolerance
        fprintf('Точка %d (%.1f, %.1f, %.1f) лежить НА розділювальній площині.\n', ...
                i, pt(1), pt(2), pt(3));
    else
        fprintf('Точка %d (%.1f, %.1f, %.1f) не лежить на площині. Відстань до неї: %.4f\n', ...
                i, pt(1), pt(2), pt(3), distance);
    end
end

%% Візуалізація
figure;
plotpv(X, T);
hold on;
plotpc(net.IW{1,1}, net.b{1});
title('Класифікація 3D образів');
xlabel('X1'); ylabel('X2'); zlabel('X3');
grid on;