function [numAccesos,accesosInfo] = contarAccesos3(dataTable, umbralTiempo)
    % Entradas:
    % - dataTable: La tabla que contiene los datos con la columna de tiempo.
    % - umbralTiempo: El umbral de tiempo en segundos para considerar un nuevo acceso.
    
    % Ordenar la tabla por la columna de tiempo si no está ordenada
    if ~issorted(dataTable.Time)
        dataTable = sortrows(dataTable, 'Time');
    end

    % Inicializar el contador de accesos y el tiempo gastado
    numAccesos = 0;
    tiempoxAcceso = 0;
    
    % Inicializar una matriz vacía para almacenar los datos de acceso
    accesosData = [];
    
    % Recorrer las filas de la tabla
    for i = 1:(height(dataTable)-1)
        % Calcular la diferencia de tiempo en segundos entre filas contiguas
        tiempoDiferencia = seconds(dataTable.Time(i+1) - dataTable.Time(i));
        
        % Si la diferencia de tiempo es mayor que el umbral, consideramos un nuevo acceso
        if tiempoDiferencia > umbralTiempo
            numAccesos = numAccesos + 1;
            % Agregar los datos de acceso a la matriz
            accesosData = [accesosData; numAccesos, tiempoxAcceso];
            tiempoxAcceso = 0; % Reiniciar el contador de tiempo gastado
        else
            % Sumar el tiempo a tiempoxAcceso si no se supera el umbral
            tiempoxAcceso = tiempoxAcceso + tiempoDiferencia;
        end
    end
    
    % Añadir 1 al contador para incluir el primer acceso
    numAccesos = numAccesos + 1;
    
    % Agregar los datos del último acceso (desde el último registro hasta el final)
    if ~isempty(dataTable)
        tiempoDiferenciaFinal = seconds(dataTable.Time(end) - dataTable.Time(end - 1));
        tiempoxAcceso = tiempoxAcceso + tiempoDiferenciaFinal;
        accesosData = [accesosData; numAccesos, tiempoxAcceso];
    end
    
    % Crear una tabla a partir de los datos de acceso
    accesosInfo = array2table(accesosData, 'VariableNames', {'NumeroDeAcceso', 'tiempoxAcceso'});
end
