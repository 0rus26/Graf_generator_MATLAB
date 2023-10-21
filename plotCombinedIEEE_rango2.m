function [fechaInicial, fechaFinal] = plotCombinedIEEE_rango2(dataTable, xColumn, yColumns, yUnits, yLabels, colors, ylabelText, xlabelText, legendLocation, titleText)
    
    % Entradas:
    % - dataTable: La tabla que contiene los datos.
    % - xColumn: El nombre de la columna datetime en el eje x.
    % - yColumns: Un cell array de strings con los nombres de las columnas en el eje y.
    % - yUnits: Un cell array de strings con las unidades correspondientes a las columnas en el eje y.
    % - yLabels: Un cell array de strings con las etiquetas para las columnas en el eje Y.
    % - colors: Un cell array de strings con los colores correspondientes a cada variable.
    % - ylabelText: Texto para la etiqueta del eje y.
    % - xlabelText: Texto para la etiqueta del eje x.
    % - legendLocation: Ubicación de la leyenda.
    % - titleText: Texto para el título basado en las fechas seleccionadas.

    % Solicitar al usuario las fechas mínimas y máximas para el rango de fechas
    minDate = min(dataTable.(xColumn));
    maxDate = max(dataTable.(xColumn));    
    prompt = {sprintf('Fecha mínima (dd-MMM-yyyy HH:mm:ss) [Predeterminada: %s]:', datestr(minDate, 'dd-mmm-yyyy HH:MM:SS')), ...
              sprintf('Fecha máxima (dd-MMM-yyyy HH:mm:ss) [Predeterminada: %s]:', datestr(maxDate, 'dd-mmm-yyyy HH:MM:SS'))};
    dlgtitle = 'Selección de Rango de Fechas';
    dims = [1 50];
    definput = {datestr(minDate, 'dd-mmm-yyyy HH:MM:SS'), datestr(maxDate, 'dd-mmm-yyyy HH:MM:SS')};
    answer = inputdlg(prompt, dlgtitle, dims, definput);
    if isempty(answer)
        % El usuario canceló la selección del rango de fechas
        fechaInicial = [];
        fechaFinal = [];
        return;
    end

    % Obtener las fechas mínimas y máximas ingresadas por el usuario
    fechaInicial = datetime(answer{1}, 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');
    fechaFinal = datetime(answer{2}, 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');
    
    % Convertir la columna de fechas al formato datetime en la tabla
    dataTable.(xColumn) = datetime(dataTable.(xColumn), 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');

    % Filtrar datos dentro del rango de fechas especificado
    filterIdx = (dataTable.(xColumn) >= fechaInicial) & (dataTable.(xColumn) <= fechaFinal);
    filteredData = dataTable(filterIdx, :);

    % Graficar todas las columnas en el mismo eje y con colores personalizados
    figure; % Crear una figura
    hold on; % Mantén los gráficos en el mismo eje
    for i = 1:length(yColumns)
        yData = filteredData.(yColumns{i});
        plot(filteredData.(xColumn), yData, 'LineWidth', 1.5, 'DisplayName', [yLabels{i} ' (' yUnits{i} ')'], 'Color', colors{i}); % Agrega DisplayName y Color
    end
    hold off; % Deja de mantener los gráficos en el mismo eje

    % Establecer los límites del eje Y con el margen de 0.01 en el eje negativo
    ylim([-5, max(filteredData{:, yColumns}, [], 'all')]);

    % Personalización del formato IEEE
    ylabel(ylabelText, 'FontSize', 10); % Establece la etiqueta del eje y
    grid on;

    % Configurar el eje x para mostrar fechas en el formato 'dd-MMM HH:mm'
    datetick('x', 'dd-mmm HH:MM', 'keepticks', 'keeplimits');
    xlabel(xlabelText, 'FontSize', 10); % Establece la etiqueta del eje x
    xtickangle(45);  % Gira las etiquetas del eje x para mejorar la legibilidad

    % Agrega una leyenda para diferenciar las columnas
    legend('Location', legendLocation, 'FontSize', 10);

    % Establece el título del gráfico
    title(titleText, 'FontSize', 12);

    % Requerimientos - Líneas punteadas
    requirement1 = 6.25; % Requerimiento 1 (ejemplo)
    requirement2 = 66.35; % Requerimiento 2 (ejemplo)
    requirement3 = 5.1; % Requerimiento 2 (ejemplo)
    
    line([min(filteredData.(xColumn)), max(filteredData.(xColumn))], [requirement1, requirement1], 'LineStyle', '--', 'Color', 'k', 'LineWidth', 1.5,'DisplayName', ['Requirement C/N (' num2str(requirement1) ' dB)']);
    line([min(filteredData.(xColumn)), max(filteredData.(xColumn))], [requirement2, requirement2], 'LineStyle', '--', 'Color', [1, 0.5, 0],'LineWidth', 1.5, 'DisplayName', ['Requirement C/No (' num2str(requirement2) ' dBHz)']);
    line([min(filteredData.(xColumn)), max(filteredData.(xColumn))], [requirement3, requirement3], 'LineStyle', '--', 'Color', 'm', 'LineWidth', 1.5,'DisplayName', ['Requirement Eb/No (' num2str(requirement3) ' dB)']);
end
