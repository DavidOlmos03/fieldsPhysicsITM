% Sara Estefania Bermudez Alvarez
% sarabermudez265321@correo.itm.edu.co

clc;
clear;
close all;

% Función de potencial gravitacional f
f = @(x,y) -(log((x+0.5+sqrt((x+0.5).^2+(y-1).^2))./(x-0.5+sqrt((x-0.5).^2+(y-1).^2)))...
    +log(((1/2)*(y)+0.5+sqrt(((1/2)*(y)+0.5).^2+(x).^2))./((1/2)*(y)-0.5+sqrt(((1/2)*(y)-0.5).^2+(x).^2)))...
    +log(((-x-0.5)+0.5+sqrt(((-x-0.5)+0.5).^2+((y+2)-1).^2))./((-x-0.5)-0.5+sqrt(((-x-0.5)-0.5).^2+((y+2)-1).^2)))...
    +log(((1/2)*(y+0.5)*2+0.5+sqrt(((1/2)*(y+0.5)*2+0.5).^2+(x+1).^2))./((1/2)*(y+0.5)*2-0.5+sqrt(((1/2)*(y+0.5)*2-0.5).^2+(x+1).^2))));

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