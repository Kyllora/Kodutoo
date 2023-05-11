unit IsikukoodValideerimine_FNC;

// tehtud https://et.wikipedia.org/wiki/Isikukood põhiselt

interface

uses System.Classes,System.SysUtils,System.DateUtils;

function ValidatePersonlaCodeEE(const aPersonalCode:String):Boolean;

implementation

// isikukoodi kontrollimine
function ValidatePersonlaCodeEE(const aPersonalCode:String):Boolean;

    // kontrolkoodi kontrolline
    function ControlCode(const aPersonalCode:String):Boolean;
    const Astme1: array  [1..10] of Integer = (1,2,3,4,5,6,7,8,9,1);
          Astme2: array  [1..10] of Integer = (3,4,5,6,7,8,9,1,2,3);
    var i,ksum1,ksum2:Integer;
        jaak1,jaak2:Real;
    begin

      ksum1:=0;
      ksum2:=0;

      for i := 1 to 10 do begin
        ksum1:=ksum1+(StrToInt(aPersonalCode[i]) * Astme1[i]);
        ksum2:=ksum2+(StrToInt(aPersonalCode[i]) * Astme2[i]);
      end;

      jaak1:= ksum1 - Trunc(ksum1 / 11) * 11;
      jaak2:= ksum2 - Trunc(ksum1 / 11) * 11;

      if jaak1 < 10 then
        Result:= jaak1 = StrToInt(aPersonalCode[11])
      else
        if jaak2 < 10 then
          Result:= jaak2 = StrToInt(aPersonalCode[11])
        else
           Result:= 0 = StrToInt(aPersonalCode[11])
    end;

const SunniAasta: array  [1..8] of Integer = (1800,1800,1900,1900,2000,2000,2100,2100);
var s,yy,mm,dd,nnnn:Integer;
begin

  // Eesti isikukood 11 pitkus, ainult numbrit
  // 12345678901
  // syymmddnnnn

  if (Length(aPersonalCode)=11) and TryStrToInt(Copy(aPersonalCode,1,1),s) and ((s >= 1) and (s <= 8))    // pitkus ja sünniaasta
    and TryStrToInt(Copy(aPersonalCode,2,2),yy) and TryStrToInt(Copy(aPersonalCode,4,2),mm) and TryStrToInt(Copy(aPersonalCode,6,2),dd) //kuupäev
    and TryStrToInt(Copy(aPersonalCode,8,4),nnnn) then
  begin

    yy:=yy+SunniAasta[s];

    Result:= IsValidDate(yy,mm,dd) and ControlCode(aPersonalCode);    ;  // kas on päris DateTime ja kontrolli koood öige

  end
  else
    Result:= False;

end;



end.
