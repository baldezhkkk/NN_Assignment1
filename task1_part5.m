% Навчальні дані
X = [-0.5  0.4 -0.8 -1.0 -0.5  1.3  1.0  1.5 -0.5  0.2;
      3.0  2.5  0.3 -0.4 -0.1  0.5 -0.2  0.8 -1.5 -1.3];

T = [1  1  0  0  0  1  1  1  0  0;
     0  0  0  0  0  1  1  1  1  1];

% Формування персептрона
net = perceptron;

% Навчання за допомогою train
net.trainParam.epochs = 1000;
net = train(net, X, T);

% Тестування за допомогою sim
Y = sim(net, X);
disp('Очікувані:'); disp(T)
disp('Отримані:');  disp(double(Y))
fprintf('Помилок: %d\n', sum(any(Y ~= T)));

% Візуалізація
figure;
plotpv(X, T);
hold on;
plotpc(net.IW{1,1}(1,:), net.b{1}(1));
plotpc(net.IW{1,1}(2,:), net.b{1}(2));
title('Класифікація на 4 класи');
xlabel('X(1)'); ylabel('X(2)');
grid on;