uses dos;
var c:char;
begin
    assign(input,'source.bf');
    assign(output,'source.pas');
    reset(input);
    rewrite(output);
    writeln('var');
    writeln('c:array[1..100000] of byte;');
    writeln('pointer:longint;');
    writeln('tmp:char;');
    writeln('begin');
    writeln('fillchar(c,sizeof(c),0);');
    writeln('pointer:=1;');
    while not(eof) do
    begin
        read(c);
        case c of
            '>':writeln('inc(pointer);');
            '<':writeln('dec(pointer);');
            '+':writeln('inc(c[pointer]);');
            '-':writeln('dec(c[pointer]);');
            '.':writeln('write(chr(c[pointer]));');
            ',':begin writeln('read(tmp);'); writeln('c[pointer]:=ord(tmp);'); end;
            '[':begin writeln('while ord(c[pointer])<>0 do'); writeln('begin'); end;
            ']':writeln('end;');
        end;
    end;
    writeln('end.');
    close(input);
    close(output);
    exec('fpc','source.pas -O4');
end.
