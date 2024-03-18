% Juan David Ruiz Olmos
% juanruiz309381@correo.itm.edu.co

clc;
clear;
close all;

% Función de potencial gravitacional f
% En el origen f = asinh((10.*(x) - 3)./(10.*(y)))-asinh(((10.*(x))+3)./(10.*(y)))
f = @(x,y) (asinh((10.*(x) - 3)./(10.*(y-1)))-asinh(((10.*(x))+3)./(10.*(y-1))))...
    +(asinh((10.*(y).*(1./2) - 3)./(10.*(x)))-asinh(((10.*(y).*(1./2))+3)./(10.*(x))))...
    +(asinh((10.*(x+0.5) - 3)./(10.*(y+1)))-asinh(((10.*(x+0.5))+3)./(10.*(y+1))))...
    +(asinh((10.*(y+0.5) - 3)./(10.*(x+1)))-asinh(((10.*(y+0.5))+3)./(10.*(x+1))));


% Definir un rango para x e y
x_range = linspace(-1.5, 1.5, 100);
y_range = linspace(-1.5, 1.5, 100);

% Crear una malla de puntos para x e y
[x, y] = meshgrid(x_range, y_range);

% Calcular el potencial en cada punto de la malla
z = f(x, y);

% Calcular el gradiente del potencial (campo gravitacional)
[gx, gy] = gradient(-z, x_range, y_range);

% Calcular la magnitud del campo gravitacional (intensidad)
g_magnitude = hypot(gx, gy);

% Visualizar la intensidad del campo gravitacional
figure;
surf(x, y, -g_magnitude);
shading interp;
colorbar;
% Etiquetas de la gráfica
xlabel('x');
ylabel('y');
zlabel('Intensidad del Campo Gravitacional');
title('Intensidad del Campo Gravitacional de J');

% Visualizar la potencial del campo gravitacional
figure
fsurf(f,[-2 2],'ShowContours','on')
%surf(x, y, z);
shading interp;
colorbar;
% Etiquetas de la gráfica
xlabel('x');
ylabel('y');
zlabel('Potencial del Campo Gravitacional');
title('Potencial del Campo Gravitacional de J');