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
[x,y] = meshgrid(x_range, y_range);

% Calcular el potencial en cada punto de la malla
z = f(x, y);

% Calcular el gradiente del potencial (campo gravitacional)
[gx, gy] = gradient(-z, x_range, y_range);

% Calcular la magnitud del campo gravitacional (intensidad)
g_magnitude = hypot(gx, gy);

% Gráfica de malla (potencial)
figure;
mesh(x,y,z)
% Etiquetas de la gráfica
xlabel('x/l')
ylabel('y/l')
zlabel('V(x,y)')
title('Potencial gravitacional - malla')
view(25,45)

% Gráfica de superficie tridimensional (potencial)
figure;
surf(x,y,z)
% Etiquetas de la gráfica
xlabel('x/l')
ylabel('y/l')
zlabel('V(x,y)')
title('Potencial gravitacional - superficie')
view(25,45)


% Gráfica de malla (intensidad)
figure;
mesh(x,y,-g_magnitude)
% Etiquetas de la gráfica
xlabel('x/l')
ylabel('y/l')
zlabel('V(x,y)')
title('Intensidad gravitacional - malla')
view(25,45)

% Gráfica de superficie tridimensional (intensidad)
figure;
surf(x,y,-g_magnitude)
% Etiquetas de la gráfica
xlabel('x/l')
ylabel('y/l')
zlabel('V(x,y)')
title('Intensidad gravitacional - superficie')
view(25,45)