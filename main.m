% Cargar la tabla de datos
%load('mi_tabla.mat');  % Asegúrate de que esta línea sea adecuada para cargar tus datos
% Columnas data Range,Azimuth,Elevation,XmtrPower,XmtrGain,EIRP,FreeSpaceLoss,AtmosLoss,RainLoss,CloudsFogLoss,TropoScintillLoss ,
% Columnas data PropLoss, FreqDopplerShift,RcvdFrequency,RcvdIsoPower,FluxDensity,gT,CNo,Bandwidth,CN,EbNo,BER,LinkMargin

% Definir los parámetros
xColumn = 'Time';
yColumns = {'Range', 'Elevation', 'Azimuth'};
xLabel = 'Tiempo';
yLabels = {'Distance (km)', 'Elevation (deg)', 'Azimuth (deg)'};
titleFontSize = 12;
axisFontSize = 10;

% Llamar a la función para generar el gráfico interactivo
%interactiveDatetimePlot(Hispico_Nadir, 'Time', yColumns, xLabel, yLabels, titleFontSize, axisFontSize);

interactiveDatetimePlot(Hispico_Nadir, xColumn, yColumns);
