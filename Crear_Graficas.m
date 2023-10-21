% Cargar la tabla de datos
%load('mi_tabla.mat');  % Asegúrate de que esta línea sea adecuada para cargar tus datos
% Columnas data Range,Azimuth,Elevation,XmtrPower,XmtrGain,EIRP,FreeSpaceLoss,AtmosLoss,RainLoss,CloudsFogLoss,TropoScintillLoss ,
% Columnas data PropLoss, FreqDopplerShift,RcvdFrequency,RcvdIsoPower,FluxDensity,gT,CNo,Bandwidth,CN,EbNo,BER,LinkMargin

FreeSpaceLoss, AtmosLoss, RainLoss, CloudsFogLoss, TropoScintillLoss, PropLoss

% Cargar los datos desde un archivo o cualquier otra fuente
% Ejemplo: cargar datos desde un archivo .mat
% load('mi_tabla.mat');  % Asegúrate de que esta línea sea adecuada para cargar tus datos

% Definir los nombres de las columnas que deseas graficar
xColumn = 'Time';
yColumns = {'Range', 'Elevation', 'Azimuth'};
yUnits = {'km', 'deg', 'deg'};  % Unidades correspondientes a las columnas en el eje Y
yLabels = {'Range (km)', 'Elevation (deg)', 'Azimuth (deg)'};

% Llamar a la función para generar el gráfico en formato IEEE con unidades en las etiquetas del eje Y
%plotIEEEFormat(Hispico_Nadir, xColumn, yColumns, yUnits, yLabels);




% Llamar a la función para generar el gráfico czlkombinado en formato IEEE
%plotCombinedIEEEFormat(Hispico_Nadir, xColumn, yColumns, yUnits, yLabels);

%nombreArchivo = 'grafico.png';  % Nombre del archivo de imagen
%saveas(gcf, nombreArchivo);  

%% Perdidas FSPL
%'FreeSpaceLoss', 'AtmosLoss', 'RainLoss', 'CloudsFogLoss','TropoScintillLoss', 'PropLoss'
Table_section = Tabla_6meses;
xColumn = 'Time';
%funciona bien
%yColumns = {'FreeSpaceLoss', 'PropLoss'};
yColumns = {'FreeSpaceLoss'};
yUnits = {'dB'};
yLabels = {'Free Space Loss'};
colors = {'r'};
ylabelText = 'Free Space Loss (dB)';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'Free Space Loss in LEOpar LB for a worst-case acces';

[fechaInicial, fechaFinal]= plotCombinedIEEE_rango(Table_section, xColumn, yColumns, yUnits, yLabels, colors, ylabelText, xlabelText, legendLocation, titleText);
%contar accesos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);
disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);


%% Perdidas leves peor escenario
%funciona bien
%'FreeSpaceLoss', 'AtmosLoss', 'RainLoss', 'CloudsFogLoss','TropoScintillLoss', 'PropLoss'
%Time: 12-Apr-2023 00:00:00
%Time: 13-Apr-2023 00:00:00
Table_section = Tabla_6meses;
xColumn = 'Time';
%yColumns = {'FreeSpaceLoss', 'AtmosLoss', 'RainLoss', 'CloudsFogLoss','TropoScintillLoss', 'PropLoss'};
yColumns = { 'RainLoss', 'CloudsFogLoss','AtmosLoss' };
yUnits = {'dB', 'dB', 'dB'};
yLabels = {'Rain Losses', 'Clouds Fog Losses','Atmospheric Losses'};
colors = { 'r', 'c', 'm'};
ylabelText = 'Losses (dB)';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'Atmospheric Losses for LEOpar LB on worst-case acces';

[fechaInicial, fechaFinal]= plotCombinedIEEE_rango(Table_section, xColumn, yColumns, yUnits, yLabels, colors, ylabelText, xlabelText, legendLocation, titleText);
%contar accesos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);

disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);


%% Perdidas por apuntamiento. variación APuntamiento

Table_section = myTable;

%'FreeSpaceLoss', 'AtmosLoss', 'RainLoss', 'CloudsFogLoss','TropoScintillLoss', 'PropLoss'
%Time: 12-Apr-2023 00:00:00
%Time: 13-Apr-2023 00:00:00

xColumn = 'Time';
%yColumns = {'FreeSpaceLoss', 'AtmosLoss', 'RainLoss', 'CloudsFogLoss','TropoScintillLoss', 'PropLoss'};
yColumns = { 'EIRP' };
yUnits = {'dB' };
yLabels = {'EIRP'};
colors = { 'r'};
ylabelText = 'Energy  (dBw)';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'EIRP';

[fechaInicial, fechaFinal]= plotCombinedIEEE_rango(Table_section, xColumn, yColumns, yUnits, yLabels, colors, ylabelText, xlabelText, legendLocation, titleText);
%contar accesos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);

disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);



%% Rango 6 meses distancia entre GS y LEOpar
%funciona bien

Table_section = Tabla_6meses;

xRangeColumn = 'Time';
yRangeColumns = {'Range'};
yRangeUnits = {'km', };
yRangeLabels = {'Range (m)'};
Rangecolors = {'r', 'y'};
ylabelText = 'Distance (m)';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'Distance between LEOpar and GSBU';
[fechaInicial, fechaFinal]= plotCombinedIEEE_rango(Table_section, xRangeColumn, yRangeColumns, yRangeUnits, yRangeLabels, Rangecolors, ylabelText, xlabelText, legendLocation, titleText);

%contar accesos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);

disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);


%% Perdidas

Table_section = Tabla_6meses;
xRangeColumn = 'Time';
yRangeColumns = {'Range'};
yRangeUnits = {'km', };
yRangeLabels = {'Range (m)'};
Rangecolors = {'r', 'y'};
ylabelText = 'Distance (m)';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'Distance between LEOpar and GSBU';
[fechaInicial, fechaFinal]= plotCombinedIEEE_rango(Table_section, xRangeColumn, yRangeColumns, yRangeUnits, yRangeLabels, Rangecolors, ylabelText, xlabelText, legendLocation, titleText);

%contar accesos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);

disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);

%% Discución
% Iso power, Cn , C/No, EbNo, BER
% Columnas data Range,Azimuth,Elevation,XmtrPower,XmtrGain,EIRP,FreeSpaceLoss,AtmosLoss,RainLoss,CloudsFogLoss,TropoScintillLoss ,
% Columnas data PropLoss, FreqDopplerShift,RcvdFrequency,RcvdIsoPower,FluxDensity,gT,CNo,Bandwidth,CN,EbNo,BER,LinkMargin

Table_section = Tabla_6meses;
xColumn = 'Time';
yColumns = {'CN','CNo','EbNo'};  % Nombres de las columnas en 'myTable'
yUnits = {'dB','dB*Hz','dB'};  % Unidades correspondientes a las columnas
yLabels = {'C/N','C/No','Eb/No'};  % Etiquetas para las columnas
colors = { 'r', 'b', 'g'};
ylabelText = ' LB requeriments ';
xlabelText = 'Time';
legendLocation = 'Best'; % Ubicación de la leyenda (puedes cambiarla según tus preferencias)
titleText = 'LB requeriments for LEOpar on worst-case acces';
[fechaInicial, fechaFinal]= plotCombinedIEEE_rango2(Table_section, xColumn, yColumns, yUnits, yLabels, colors, ylabelText, xlabelText, legendLocation, titleText);
%contar accesos
% Requerimientos
filterIdx = (Table_section.Time >= fechaInicial) & (Table_section.Time <= fechaFinal);
temporalData = Table_section(filterIdx, {'Time'});
umbralTiempo = 11; % Ajusta el umbral según sea necesario
[numAccesos,accesosInfo] = contarAccesos3(temporalData, umbralTiempo);
promedioTiempoAcceso = mean(accesosInfo.tiempoxAcceso);
disp(['Número de accesos: ', num2str(numAccesos)]);
disp(['Promedio de acceso: ', num2str(promedioTiempoAcceso)]);


%% GUardar archivo


% Nombre del archivo de imagen
%nombreArchivo = 'Principal_Losses_Nadir.png';

% Guarda la figura actual como una imagen en el formato deseado (por ejemplo, PNG)
%saveas(gcf, nombreArchivo);

% Cierra la figura si ya no la necesitas
%close(gcf);


