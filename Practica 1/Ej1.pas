program Ej1;
type
    archivo_enteros =  file of integer;
var
   numeros: archivo_enteros;
   num:integer;
   imp:integer;
begin
     assign(numeros,'C:\Users\Tyrant Rex\Documents\FOD Practicas\Practica 1\num.dat');
     rewrite(numeros);
     writeln('Ingrese un numero:');
     readln(num);
     while(num <> 3000) do begin
               write(numeros,num);
               writeln('Ingrese un numero:');
               readln(num);
               end;
     seek(numeros,0);
     while not(EOF(numeros)) do begin
           read(numeros,imp);
           writeln('El numero es ',imp);
           end;
     readln();
end.



