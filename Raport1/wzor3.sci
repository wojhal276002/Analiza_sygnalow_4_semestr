function y = f2(N)
    t = -%pi:0.01:%pi
    
    y = (%pi + 2)/4
    
    for n = 1:N
        y = y + ((-1)**n - 1)/(%pi*n**2) * cos(n*t) + ((-1)**n * (1-%pi)- 1)/(n*%pi) * sin(n*t)
    end
endfunction


function y = f2_og()
    N = length(t)
    t = -%pi:0.01:%pi
    
    // Inicjalizacja wektora y
    y = zeros(1, N);
    
    // Definicja funkcji f(t) w zależności od przedziału
    for i = 1:N
        if t(i) > -%pi & t(i) < 0 then
            y(i) = 1;
        elseif t(i) > 0 & t(i) < %pi then
            y(i) = t(i);
        elseif t(i) == 0 then
            y(i) = 0.5;
        elseif t(i) == %pi then
            y(i) = 0.5 * (%pi + 1);
        end
    end
endfunction


t = -%pi:0.01:%pi

//Współczynniki metodą numeryczną

//Współczynnik a_0
a_0 = (integrate("1", "t", -%pi, 0) + integrate("t", "t", 0, %pi)) / %pi

// Funkcje obliczające współczynniki Fouriera

//Współczynnik A_n
function a_n = fourier_a(n)
    a_n = (integrate("cos(n*t)", "t", -%pi, 0) + integrate("t*cos(n*t)", "t", 0, %pi)) / %pi 
endfunction

//Współczynnik B_n
function b_n = fourier_b(n)
    b_n = (integrate("sin(n*t)", "t", -%pi, 0) + integrate("t*sin(n*t)", "t", 0, %pi)) / %pi
endfunction


// Funkcja do obliczania szeregu Fouriera ze współczynnikami obliczonymi numerycznie
function y = fun_z_numer(t, N)
    // Stała część wyrażenia
    y = a_0/2
    
    // Sumowanie dla n od 1 do N
    for n = 1:N
        
        //Współczynnik A_n
        a_n = fourier_a(n)
        
        // Współczynnik B_n
        b_n = fourier_b(n)
        
        // Sumujemy 
        y = y + a_n/2 *(cos(n*t)) + b_n*(sin(n*t))
    end
end

t = -%pi:0.01:%pi
N = 8

// Wykres oryginalnej funkcji i zrekonstruowanej funkcji

clf
plot(t, f2_og(), 'r', t, f2(1), 'go', t, fun_z_numer(t,1), 'b-');
legend('oryginalna funkcja', 'fourier analitycznie', 'fourier numerycznie');
xtitle('Porównanie oryginalnej i zrekonstruowanych funkcji (N=1)', 't', 'f(t)');
xs2png(0, 'C:\Users\zawer\Documents\scilab\raport1\wykres1_2_1.png');

clf
plot(t, f2_og(), 'r', t, f2(2), 'go', t, fun_z_numer(t,2), 'b-');
legend('oryginalna funkcja', 'fourier analitycznie', 'fourier numerycznie');
xtitle('Porównanie oryginalnej i zrekonstruowanych funkcji (N=2)', 't', 'f(t)');
xs2png(0, 'C:\Users\zawer\Documents\scilab\raport1\wykres1_2_2.png');

clf
plot(t, f2_og(), 'r', t, f2(4), 'go', t, fun_z_numer(t,4), 'b-');
legend('oryginalna funkcja', 'fourier analitycznie', 'fourier numerycznie');
xtitle('Porównanie oryginalnej i zrekonstruowanych funkcji (N=4)', 't', 'f(t)');
xs2png(0, 'C:\Users\zawer\Documents\scilab\raport1\wykres1_2_4.png');

clf
plot(t, f2_og(), 'r', t, f2(8), 'go', t, fun_z_numer(t,8), 'b-');
legend('oryginalna funkcja', 'fourier analitycznie', 'fourier numerycznie');
xtitle('Porównanie oryginalnej i zrekonstruowanych funkcji (N=8)', 't', 'f(t)');
xs2png(0, 'C:\Users\zawer\Documents\scilab\raport1\wykres1_2_8.png');



/// MAE oraz RMSE ///


N_values = [1, 2, 4, 8]; // Wartości N

// Predefiniowanie wektorów na wyniki
MAE = zeros(1, length(N_values));
RMSE = zeros(1, length(N_values));

// Funkcja do obliczania MAE
function mae = calculate_mae(f, f_approx)
    mae = mean(abs(f - f_approx));
endfunction

// Funkcja do obliczania RMSE
function rmse = calculate_rmse(f, f_approx)
    rmse = sqrt(mean((f - f_approx).^2));
endfunction

    // Obliczanie błędów MAE i RMSE
    for i = 1:length(N_values)
        MAE(i) = calculate_mae(f2_og(), f2(N_values(i)));
        RMSE(i) = calculate_rmse(f2_og(), f2(N_values(i)));
end

// Wyświetlanie wyników
disp('N values:'), disp(N_values)
disp('MAE values:'), disp(MAE)
disp('RMSE values:'), disp(RMSE)
