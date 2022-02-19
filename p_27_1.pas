function FileExists(const fileName : string) : boolean;
var
    myFile : text;
begin
    FileExists := false;
    Assign(myFile, fileName);
    {$I-}
    Reset(myFile);
    {$I+}
    if (IOResult = 0 ) then begin
        Close(myFile);
        FileExists := true;
    end;
end;

begin
    writeln(FileExists('system.bat'));
    writeln(FileExists('p_27_1.pas'));
end.
