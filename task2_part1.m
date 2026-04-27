% Навчальна вибірка
% Повісті (клас 0): до 5 героїв, до 200 сторінок
X_novel = [2 3 4 5 1 3 5 4 2 5;
           50 80 120 180 30 150 200 90 60 170];

% Романи (клас 1): більше 5 героїв, більше 200 сторінок
X_roman = [6  7  8 10  9  6 12  8  7 11;
           250 300 400 500 350 220 600 280 320 450];

X = [X_novel, X_roman];
T = [zeros(1,10), ones(1,10)];

% Нормування
X_norm = [X(1,:)/max(X(1,:)); X(2,:)/max(X(2,:))];

% Формування персептрона з нормованою функцією навчання
net = perceptron('hardlim', 'learnpn');
net.trainParam.epochs = 1000;

% Навчання за допомогою train
net = train(net, X_norm, T);

% Тестування за допомогою sim
Y = sim(net, X_norm);
fprintf('Помилок: %d / %d\n', sum(Y ~= T), length(T));

%% Візуалізація
figure;
plotpv(X_norm, T);
hold on;
plotpc(net.IW{1,1}, net.b{1});
title('Повісті vs Романи');
xlabel('Герої (норм.)'); ylabel('Сторінки (норм.)');
grid on;