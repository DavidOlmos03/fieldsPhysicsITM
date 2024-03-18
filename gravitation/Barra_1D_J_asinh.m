clc;
clear;
close all;

% Función de potencial gravitacional f
% En el origen f = asinh((10.*(x) - 3)./(10.*(y)))-asinh(((10.*(x))+3)./(10.*(y)))
f = @(x,y) -((asinh((10.*(x) - 3)./(10.*(y-1)))-asinh(((10.*(x))+3)./(10.*(y-1))))...
    +(asinh((10.*(y).*(1./2) - 3)./(10.*(x)))-asinh(((10.*(y).*(1./2))+3)./(10.*(x))))...
    +(asinh((10.*(x+0.5) - 3)./(10.*(y+1)))-asinh(((10.*(x+0.5))+3)./(10.*(y+1))))...
    +(asinh((10.*(y+0.5) - 3)./(10.*(x+1)))-asinh(((10.*(y+0.5))+3)./(10.*(x+1)))));

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

