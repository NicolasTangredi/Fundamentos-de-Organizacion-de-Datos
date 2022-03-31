program Ej3;
type
    empleados = record
              num:integer;
              ape:string;
              nom:string;
              edad:integer;
              dni:integer;
              end;
    archivo_empleados =  file of empleados;
    archivo_txt = file of String;
var
   archivo:archivo_empleados;
   emple:empleados;
   decidir:integer;
   nombre:string;
procedure caso1(var archivo:archivo_empleados ; emple:empleados);
begin
       rewrite(archivo);
       while(emple.ape <> 'fin') do begin
       writeln('----------------------------------------------');
       writeln('Ingrese el apellido del empleado');
       readln(emple.ape);
       if (emple.ape <> 'fin') then begin
          writeln('Ingrese el nombre del empleado');
          readln(emple.nom);
          writeln('Ingrese el numero de empleado');
          readln(emple.num);
          writeln('Ingrese la edad del empleado');
          readln(emple.edad);
          writeln('Ingrese el DNI del empleado');
          readln(emple.dni);
          write(archivo,emple);
       end;
       writeln('----------------------------------------------');
    end;
    close(archivo);
end;
procedure caso2(var archivo:archivo_empleados ; emple:empleados);
begin
 reset(archivo);
        writeln('Ingrese el nombre o apellido del empleado');
        readln(nombre);
        read(archivo,emple);
        while(not(EOF(archivo))and(nombre <> emple.ape)and(nombre <> emple.nom)) do begin
        read(archivo,emple);
        end;
        if (not(EOF(archivo))) then begin
        writeln('Nombre: ',emple.nom);
        writeln('Apellido: ',emple.ape);
        writeln('Edad: ',emple.edad);
        writeln('DNI: ',emple.dni);
        writeln('Numero de empleado: ',emple.num);
        end
        else begin
        writeln('No existe ningun empleado con ese nombre o apellido');
        end;
        close(archivo);

end;
procedure caso3(var archivo:archivo_empleados ; emple:empleados);
begin
     reset(archivo);
        while(not(EOF(archivo))) do begin
          read(archivo,emple);
           writeln('----------------------------------------------');
          writeln('Nombre: ',emple.nom);
          writeln('Apellido: ',emple.ape);
          writeln('Edad: ',emple.edad);
          writeln('DNI: ',emple.dni);
          writeln('Numero de empleado: ',emple.num);
           writeln('----------------------------------------------');
        end;
        close(archivo);
end;
procedure caso4(var archivo:archivo_empleados ; emple:empleados);
var
  cant:integer;
begin
     cant:=0;
     reset(archivo);
        read(archivo,emple);
        while(not(EOF(archivo))) do begin
        if(emple.edad > 70) then begin
        cant:=cant+1;
         writeln('----------------------------------------------');
        writeln('Nombre: ',emple.nom);
        writeln('Apellido: ',emple.ape);
        writeln('Edad: ',emple.edad);
        writeln('DNI: ',emple.dni);
        writeln('Numero de empleado: ',emple.num);
         writeln('----------------------------------------------');
        end;
        read(archivo,emple);
        end;
        if(cant = 0) then
        writeln('Ningun empleado esta proximo a jubilarse');
        close(archivo);
end;
procedure caso5(var archivo:archivo_empleados ; emple:empleados);
begin
       reset(archivo);
       seek(archivo,fileSize(archivo));
       while(emple.ape <> 'fin') do begin
       writeln('----------------------------------------------');
       writeln('Ingrese el apellido del empleado');
       readln(emple.ape);
       if (emple.ape <> 'fin') then begin
          writeln('Ingrese el nombre del empleado');
          readln(emple.nom);
          writeln('Ingrese el numero de empleado');
          readln(emple.num);
          writeln('Ingrese la edad del empleado');
          readln(emple.edad);
          writeln('Ingrese el DNI del empleado');
          readln(emple.dni);
          write(archivo,emple);
       end;
       writeln('----------------------------------------------');
    end;
    close(archivo);
end;
procedure caso6(var archivo:archivo_empleados ; emple:empleados);
var
   age:integer;
   N:integer;
begin
        reset(archivo);
        writeln('Ingrese el numero de empleado del empleado a modificar');
        readln(N);
        read(archivo,emple);
        while(not(EOF(archivo))and(nombre <> emple.ape)) do begin
        read(archivo,emple);
        end;
        if (not(EOF(archivo))and(emple.num = N)) then begin
        writeln('------------------------');
        writeln('Nombre: ',emple.nom);
        writeln('Apellido: ',emple.ape);
        writeln('Edad: ',emple.edad);
        writeln('DNI: ',emple.dni);
        writeln('Numero de empleado: ',emple.num);
        writeln('------------------------');
        writeln('Edad :');
        read(age);
        writeln('------------------------');
        emple.edad:=age;
        seek(archivo,filepos(archivo)-1);
        write(archivo,emple);
        writeln('Nombre: ',emple.nom);
        writeln('Apellido: ',emple.ape);
        writeln('Edad: ',emple.edad);
        writeln('DNI: ',emple.dni);
        writeln('Numero de empleado: ',emple.num);
        end
        else begin
        writeln('No existe ningun empleado con ese apellido');
        end;
        close(archivo);

end;
procedure caso7(var archivo:archivo_empleados);
var
   archivo2:archivo_txt;
   emple1:empleados;
begin
    assign(archivo2,'C:\Users\Tyrant Rex\Documents\FOD Practicas\Practica 1\TodosEmpleados.txt');
    rewrite(archivo2);
    reset(archivo);
    while(EOF(archivo))do begin
       read(archivo,emple1);
       write(archivo2,'Nombre: ');
    end;
    close(archivo);
    close(archivo2);
end;
begin
    emple.ape:='';
    assign(archivo,'C:\Users\Tyrant Rex\Documents\FOD Practicas\Practica 1\empleados.dat');
    writeln('[1]  Crear archivo de registros');
    writeln('----------------------------------------------');
    writeln('Para abrir archivo y :');
    writeln('----------------------------------------------');
    writeln('[2] -Listar datos de un empleado determinado');
    writeln('[3] -Listar todos los empleados');
    writeln('[4] -Listar empleados proximos a jubilarse');
    writeln('[5] -Añadir uno o mas empleados');
    writeln('[6] -Modificar edad a uno o mas empleados');
    writeln('[7] -Exportar contenido de archivo a: TodosEmpleados.txt');
    writeln('----------------------------------------------');
    readln(decidir);
    case decidir of
         1:      caso1(archivo,emple);
         2:      caso2(archivo,emple);
         3:      caso3(archivo,emple);
         4:      caso4(archivo,emple);
         5:      caso5(archivo,emple);
         6:      caso6(archivo,emple);
         7:      caso7(archivo);
         else
         writeln('El numero ingresado no corresponde con ninguna de las opciones');
         end;
    readln();
    readln();
end.

