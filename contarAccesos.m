function numAccesos = contarAccesos(dataTable, fechaInicial, fechaFinal, umbralTiempo)
    % Esta función cuenta el número de accesos únicos en función de un umbral de tiempo
    % dentro de un rango de fechas específico.

    % Asegurarse de que el rango de fechas esté en formato datetime
    if ~istimetable(dataTable)
        error('La tabla debe ser de tipo timetable.');
    end

    % Filtrar la tabla por el rango de fechas
    filterIdx = (dataTable.Fecha >= fechaInicial) & (dataTable.Fecha <= fechaFinal);
    filteredData = dataTable(filterIdx, :);

    % Ordenar la tabla por la columna de fechas
    filteredData = sortrows(filteredData, 'Fecha');

    % Inicializar el contador de accesos únicos
    numAccesos = 0;

    % Crear una matriz lógica para realizar un seguimiento de las entradas únicas
    entradasUnicas = false(height(filteredData), 1);

    % Iterar a través de las filas de la tabla y contar accesos únicos
    for i = 1:(height(filteredData) - 1)
        % Calcular la diferencia de tiempo en segundos entre filas consecutivas
        tiempoDif = seconds(filteredData.Fecha(i + 1) - filteredData.Fecha(i));

        % Si la diferencia de tiempo es mayor que el umbral, se considera un nuevo acceso
        if tiempoDif > umbralTiempo
            % Verificar si esta entrada aún no se ha contado
            if ~entradasUnicas(i)
                numAccesos = numAccesos + 1;
                entradasUnicas(i) = true;
            end
        end
    end
end
