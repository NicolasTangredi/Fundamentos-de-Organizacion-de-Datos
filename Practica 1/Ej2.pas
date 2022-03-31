program Ej1;
type
    archivo_enteros =  file of integer;
var
   numeros: archivo_enteros;
   num:integer;
   imp:integer;
   cant:integer;
   promedio:real;
   cant1500:integer;
begin
     cant1500:=0;
     cant:=0;
     promedio:=0;
     assign(numeros,'C:\Users\Tyrant Rex\Documents\FOD Practicas\Practica 1\num.dat');
     rewrite(numeros);
     writeln('Ingrese un numero:');
     readln(num);
     while(num <> 3000) do begin
               write(numeros,num);
               if (num < 1500) then
                  cant1500:=cant1500+1;
               cant:=cant+1;
               promedio:=promedio+num;
               writeln('Ingrese un numero:');
               readln(num);
               end;
     promedio:=promedio/cant;
     seek(numeros,0);
     while not(EOF(numeros)) do begin
           read(numeros,imp);
           writeln('El numero es ',imp);
           end;
     writeln('La cantidad de numeros es de ',cant);
     writeln('El promedio es ',promedio:0:2);
     writeln('La cantidad de numeros menores a 1500 es de ',cant1500);
     readln();
end.



