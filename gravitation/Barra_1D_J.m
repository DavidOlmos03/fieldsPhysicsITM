% Juan David Ruiz Olmos
% juanruiz309381@correo.itm.edu.co

clc;
clear;
close all;

% Función de potencial gravitacional
f = @(x,y) -(log((x+0.5+sqrt((x+0.5).^2+(y-1).^2))./(x-0.5+sqrt((x-0.5).^2+(y-1).^2)))...
    +log(((1/2)*(y)+0.5+sqrt(((1/2)*(y)+0.5).^2+(x).^2))./((1/2)*(y)-0.5+sqrt(((1/2)*(y)-0.5).^2+(x).^2)))...
    +log(((-x-0.5)+0.5+sqrt(((-x-0.5)+0.5).^2+((y+2)-1).^2))./((-x-0.5)-0.5+sqrt(((-x-0.5)-0.5).^2+((y+2)-1).^2)))...
    +log(((1/2)*(y+0.5)*2+0.5+sqrt(((1/2)*(y+0.5)*2+0.5).^2+(x+1).^2))./((1/2)*(y+0.5)*2-0.5+sqrt(((1/2)*(y+0.5)*2-0.5).^2+(x+1).^2))));

% Crear una malla de puntos donde se evaluará la función
x_range = linspace(-1.5, 1.5, 100);
y_range = linspace(-1.5, 1.5, 100);
[X, Y] = meshgrid(x_range, y_range);

% Evaluar la función en la malla de puntos
Z = f(X, Y);

% Calcular el gradiente del potencial (campo gravitacional)
[gX, gY] = gradient(-Z, x_range, y_range);

% Calcular la magnitud del campo gravitacional (intensidad)
g_magnitude = hypot(gX, gY);

% Grafica del potencial gravitacional (Intervalo de x e y, color, paso, densidad)
figure;
fcontour(f,[-1.5,1.5,-1.5,1.5], 'LevelStep', 0.5, 'MeshDensity', 100)
colorbar;
% Etiquetas de la gráfica
xlabel('x')
ylabel('y')
title('Potencial Gravitacional(x,y)')

% Grafica de la intensidad gravitacional
figure;
contourf(X, Y, g_magnitude)
colorbar; % Barra de colores para la maginitud

% Etiquetas de la gráfica
xlabel('x')
ylabel('y')
title('Intensidad Gravitacional(x,y)')
