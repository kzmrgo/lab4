% Leer los datos
heart_data = readtable("heart_data");

% Convertir edad de días a años
heart_data.age = round(heart_data.age / 365.25);

% Definir las variables binarias y sus correspondientes etiquetas
binary_variables = {'smoke', 'active', 'alco', 'cardio'};
binary_labels = {'No', 'Si'};

% Iterar sobre las variables binarias y realizar la conversión
for i = 1:length(binary_variables)
    var_name = binary_variables{i};
    heart_data.(var_name) = categorical(heart_data.(var_name), [0, 1], binary_labels);
end

% Mostrar los datos procesados
disp(heart_data);

% Calcular el IMC para cada individuo
IMC = heart_data.weight ./ (heart_data.height/100).^2; % Convertir altura a metros

% Inicializar la variable de clasificación del IMC
clasificacion_IMC = cell(size(IMC));

% Clasificar el IMC según los estándares de la OMS utilizando if
for i = 1:numel(IMC)
    if IMC(i) < 18.5
        clasificacion_IMC{i} = 'Peso insuficiente';
    elseif IMC(i) < 25
        clasificacion_IMC{i} = 'Peso normal o saludable';
    elseif IMC(i) < 30
        clasificacion_IMC{i} = 'Sobrepeso';
    else
        clasificacion_IMC{i} = 'Obesidad';
    end
end

% Mostrar los datos con el IMC y la clasificación
disp(table(heart_data.weight, heart_data.height, IMC, clasificacion_IMC));

PresionAM = (heart_data.ap_lo*2)+heart_data.ap_hi/3
% Lee la base de datos
datos = readtable('heart_data.csv'); % Ajusta el nombre y la ubicación de tu base de datos


% Extraer las edades y los géneros de la base de datos
edades = heart_data.age;
genero = heart_data.gender; % Suponiendo que la columna de género se llama 'gender'

% Definir los rangos de edad
rangos = [0, 18, 30, 45, 60, inf];

% Inicializar las variables para cada rango y género
rango_0_18_hombres = 0;
rango_19_30_hombres = 0;
rango_31_45_hombres = 0;
rango_46_60_hombres = 0;
rango_61_mas_hombres = 0;

rango_0_18_mujeres = 0;
rango_19_30_mujeres = 0;
rango_31_45_mujeres = 0;
rango_46_60_mujeres = 0;
rango_61_mas_mujeres = 0;

% Contar el número de personas en cada rango de edad para cada género
for i = 1:length(edades)
    if genero(i) == 1 % Hombre
        % Incrementar el conteo correspondiente para hombres
        if edades(i) <= 18
            rango_0_18_hombres = rango_0_18_hombres + 1;
        elseif edades(i) <= 30
            rango_19_30_hombres = rango_19_30_hombres + 1;
        elseif edades(i) <= 45
            rango_31_45_hombres = rango_31_45_hombres + 1;
        elseif edades(i) <= 60
            rango_46_60_hombres = rango_46_60_hombres + 1;
        else
            rango_61_mas_hombres = rango_61_mas_hombres + 1;
        end
    elseif genero(i) == 2 % Mujer
        % Incrementar el conteo correspondiente para mujeres
        if edades(i) <= 18
            rango_0_18_mujeres = rango_0_18_mujeres + 1;
        elseif edades(i) <= 30
            rango_19_30_mujeres = rango_19_30_mujeres + 1;
        elseif edades(i) <= 45
            rango_31_45_mujeres = rango_31_45_mujeres + 1;
        elseif edades(i) <= 60
            rango_46_60_mujeres = rango_46_60_mujeres + 1;
        else
            rango_61_mas_mujeres = rango_61_mas_mujeres + 1;
        end
    end
end

% Mostrar los resultados
disp('Hombres:');
disp(['Personas en el rango 0-18: ', num2str(rango_0_18_hombres)]);
disp(['Personas en el rango 19-30: ', num2str(rango_19_30_hombres)]);
disp(['Personas en el rango 31-45: ', num2str(rango_31_45_hombres)]);
disp(['Personas en el rango 46-60: ', num2str(rango_46_60_hombres)]);
disp(['Personas en el rango 61 en adelante: ', num2str(rango_61_mas_hombres)]);

disp('Mujeres:');
disp(['Personas en el rango 0-18: ', num2str(rango_0_18_mujeres)]);
disp(['Personas en el rango 19-30: ', num2str(rango_19_30_mujeres)]);
disp(['Personas en el rango 31-45: ', num2str(rango_31_45_mujeres)]);
disp(['Personas en el rango 46-60: ', num2str(rango_46_60_mujeres)]);
disp(['Personas en el rango 61 en adelante: ', num2str(rango_61_mas_mujeres)]);


% Extraer las edades, géneros y estado de enfermedad de la base de datos
edades = heart_data.age;
genero = heart_data.gender; % Suponiendo que la columna de género se llama 'gender'
enfermedad = heart_data.cardio; % Suponiendo que la columna de enfermedad se llama 'cardio'

% Convertir la variable de enfermedad a un tipo compatible
enfermedad_numerica = double(enfermedad);

% Definir los rangos de edad
rangos = [0, 18, 30, 45, 60, inf];

% Inicializar las variables para cada rango, género y estado de enfermedad
rango_0_18_hombres = 0;
rango_19_30_hombres = 0;
rango_31_45_hombres = 0;
rango_46_60_hombres = 0;
rango_61_mas_hombres = 0;

rango_0_18_mujeres = 0;
rango_19_30_mujeres = 0;
rango_31_45_mujeres = 0;
rango_46_60_mujeres = 0;
rango_61_mas_mujeres = 0;

hombres_enfermos = 0;
mujeres_enfermas = 0;

% Contar el número de personas en cada rango de edad para cada género y estado de enfermedad
for i = 1:length(edades)
    if genero(i) == 1 % Hombre
        % Incrementar el conteo correspondiente para hombres
        if edades(i) <= 18
            rango_0_18_hombres = rango_0_18_hombres + 1;
        elseif edades(i) <= 30
            rango_19_30_hombres = rango_19_30_hombres + 1;
        elseif edades(i) <= 45
            rango_31_45_hombres = rango_31_45_hombres + 1;
        elseif edades(i) <= 60
            rango_46_60_hombres = rango_46_60_hombres + 1;
        else
            rango_61_mas_hombres = rango_61_mas_hombres + 1;
        end
        % Verificar si el hombre sufre de la enfermedad
        if enfermedad_numerica(i) == 1 % Sufre la enfermedad
            hombres_enfermos = hombres_enfermos + 1;
        end
    elseif genero(i) == 2 % Mujer
        % Incrementar el conteo correspondiente para mujeres
        if edades(i) <= 18
            rango_0_18_mujeres = rango_0_18_mujeres + 1;
        elseif edades(i) <= 30
            rango_19_30_mujeres = rango_19_30_mujeres + 1;
        elseif edades(i) <= 45
            rango_31_45_mujeres = rango_31_45_mujeres + 1;
        elseif edades(i) <= 60
            rango_46_60_mujeres = rango_46_60_mujeres + 1;
        else
            rango_61_mas_mujeres = rango_61_mas_mujeres + 1;
        end
        % Verificar si la mujer sufre de la enfermedad
        if enfermedad_numerica(i) == 1 % Sufre la enfermedad
            mujeres_enfermas = mujeres_enfermas + 1;
        end
    end
end

% Mostrar los resultados
disp('Hombres:');
disp(['Personas en el rango 0-18: ', num2str(rango_0_18_hombres)]);
disp(['Personas en el rango 19-30: ', num2str(rango_19_30_hombres)]);
disp(['Personas en el rango 31-45: ', num2str(rango_31_45_hombres)]);
disp(['Personas en el rango 46-60: ', num2str(rango_46_60_hombres)]);
disp(['Personas en el rango 61 en adelante: ', num2str(rango_61_mas_hombres)]);
disp(['Hombres enfermos: ', num2str(hombres_enfermos)]);

disp('Mujeres:');
disp(['Personas en el rango 0-18: ', num2str(rango_0_18_mujeres)]);
disp(['Personas en el rango 19-30: ', num2str(rango_19_30_mujeres)]);
disp(['Personas en el rango 31-45: ', num2str(rango_31_45_mujeres)]);
disp(['Personas en el rango 46-60: ', num2str(rango_46_60_mujeres)]);
disp(['Personas en el rango 61 en adelante: ', num2str(rango_61_mas_mujeres)]);
disp(['Mujeres enfermas: ', num2str(mujeres_enfermas)]);

% Define los rangos de edad que deseas considerar
rangos_edad = [0, 18, 30, 45, 60, inf];

% Inicializa las variables para contar personas enfermas en cada rango de edad para hombres y mujeres
enfermos_por_rango_hombres = zeros(1, length(rangos_edad) - 1);
enfermos_por_rango_mujeres = zeros(1, length(rangos_edad) - 1);

% Itera sobre cada persona y verifica si está enferma y dentro del rango de edad, separando por género
for i = 1:length(edades)
    if enfermedad_numerica(i) == 1 % Verifica si la persona está enferma (1=Sí, 0=No)
        for j = 1:length(rangos_edad)-1 % Itera sobre los rangos de edad
            if edades(i) > rangos_edad(j) && edades(i) <= rangos_edad(j+1)
                if genero(i) == 1 % Si es hombre
                    enfermos_por_rango_hombres(j) = enfermos_por_rango_hombres(j) + 1; % Incrementa el conteo para hombres en el rango actual
                elseif genero(i) == 2 % Si es mujer
                    enfermos_por_rango_mujeres(j) = enfermos_por_rango_mujeres(j) + 1; % Incrementa el conteo para mujeres en el rango actual
                end
                break; % Sale del bucle una vez que se ha asignado a un rango
            end
        end
    end
end

% Muestra los resultados para hombres
disp('Hombres:');
for k = 1:length(enfermos_por_rango_hombres)
    if k == length(enfermos_por_rango_hombres)
        disp(['Hombres enfermos en el rango ', num2str(rangos_edad(k)), ' en adelante: ', num2str(enfermos_por_rango_hombres(k))]);
    else
        disp(['Hombres enfermos en el rango ', num2str(rangos_edad(k)), '-', num2str(rangos_edad(k+1)), ': ', num2str(enfermos_por_rango_hombres(k))]);
    end
end

% Muestra los resultados para mujeres
disp('Mujeres:');
for k = 1:length(enfermos_por_rango_mujeres)
    if k == length(enfermos_por_rango_mujeres)
        disp(['Mujeres enfermas en el rango ', num2str(rangos_edad(k)), ' en adelante: ', num2str(enfermos_por_rango_mujeres(k))]);
    else
        disp(['Mujeres enfermas en el rango ', num2str(rangos_edad(k)), '-', num2str(rangos_edad(k+1)), ': ', num2str(enfermos_por_rango_mujeres(k))]);
    end
end
appdesigner


