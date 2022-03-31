program Ej7;
type
    novelas = record
            codigo:integer;
            genero:String;
            precio:real;
            nombre:String;
            end;
    archivo_novelas = file of novelas;
var
   arch:archivo_novelas;
   nov:novelas;
   texto:Text;
   a:integer;
   d:String;

procedure agregar (var arch:archivo_novelas);
var
   nov:novelas;
begin
     reset(arch);
     while(not(eof(arch))) do begin
         read(arch,nov);
     end;
     writeln('Ingrese el codigo de la novela');
     readln(nov.codigo);
     writeln('Ingrese el precio de la novela');
     readln(nov.precio);
     writeln('Ingrese el genero de la novela');
     readln(nov.genero);
     writeln('Ingrese el nombre de la novela');
     readln(nov.nombre);
     write(arch,nov);

end;
procedure imprimir(var arch:archivo_novelas);
var
   nov:novelas;
begin
     reset(arch);
     while(not(eof(arch))) do begin
     read(arch,nov);
     writeln('----------------------------');
     writeln('Codigo : ',nov.codigo);
     writeln('Precio : ',nov.precio:0:1);
     writeln('Genero : ',nov.genero);
     writeln('Nombre : ',nov.nombre);
     writeln('----------------------------');
     end;
end;
procedure modificar(var arch:archivo_novelas);
var
   cod:integer;
   num:integer;
   nov:novelas;
begin
     writeln('Ingrese el codigo de la novela a modificar');
     readln(cod);
     reset(arch);
     read(arch,nov);
     while(not(EOF(arch)))and(cod <> nov.codigo) do begin
                                  read(arch,nov);
     end;
     if(cod = nov.codigo) then begin
            writeln('Ingrese el dato que desea modificar:');
            writeln('-------------------------------------');
            writeln('[1] Codigo');
            writeln('[2] Precio');
            writeln('[3] Genero');
            writeln('[4] Nombre');
            writeln('-------------------------------------');
            readln(num);
            writeln('Ingrese el nuevo valor: ');
            case num of
               1: readln(nov.codigo);
               2: readln(nov.precio);
               3: readln(nov.genero);
               4: readln(nov.nombre);
            end;
            seek(arch,filepos(arch)-1);
            write(arch,nov);
    end
    else begin
    writeln('El codigo de novela no existe');
    end;
end;
procedure exportar(var arch:archivo_novelas);
var
   nov:novelas;
begin
     rewrite(arch);
     while(not(eof(texto))) do begin
                           read(texto,nov.codigo);
                           read(texto,nov.precio);
                           readln(texto,nov.genero);
                           read(texto,nov.nombre);
                           write(arch,nov);
    end;
end;
begin
    assign(texto,'novelas.txt');
    assign(arch,'novelas2.txt');
    reset(texto);
    reset(arch);
    writeln('¿Desea exportar el archivo?; Y | N');
    readln(d);
    if(d = 'Y') then begin
         exportar(arch);
    end;
            writeln('Ingrese la opcion que desea:');
            writeln('-------------------------------------');
            writeln('[1] Agregar una nueva novela');
            writeln('[2] Modificar una novela existente');
            writeln('-------------------------------------');
            readln(a);
            case a of
                 1: agregar(arch);
                 2: modificar(arch);
                 3: imprimir(arch);
                 end;
    close(arch);
    close(texto);
    writeln('fin');
    readln();




end.
