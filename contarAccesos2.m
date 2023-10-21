function numAccesos = contarAccesos2(dataTable, umbralTiempo)
    % Entradas:
    % - dataTable: La tabla que contiene los datos con la columna de tiempo.
    % - umbralTiempo: El umbral de tiempo en segundos para considerar un nuevo acceso.
    
    % Ordenar la tabla por la columna de tiempo si no está ordenada
    if ~issorted(dataTable.Time)
        dataTable = sortrows(dataTable, 'Time');
    end

    % Inicializar el contador de accesos
    numAccesos = 0;
    
    % Recorrer las filas de la tabla
    for i = 1:(height(dataTable)-1)
        % Calcular la diferencia de tiempo en segundos entre filas contiguas
        tiempoDiferencia = seconds(dataTable.Time(i+1) - dataTable.Time(i));
        
        % Si la diferencia de tiempo es mayor que el umbral, consideramos un nuevo acceso
        if tiempoDiferencia > umbralTiempo
            numAccesos = numAccesos + 1;
        end
    end
    
    % Añadir 1 al contador para incluir el primer acceso
    numAccesos = numAccesos + 1;
end
