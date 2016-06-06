unit ErrorCorrectionLevel;

{
  * Copyright 2008 ZXing authors
  *
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *      http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.

  * Implemented by E. Spelt for Delphi
}
interface

uses
  SysUtils;

type
  TErrorCorrectionLevel = class
  private
    Fbits: Integer;
    Fname: string;
    Fordinal_Renamed_Field: Integer;
    class var
      FOR_BITS: TArray<TErrorCorrectionLevel>;
    class procedure InitClass; static;
    class procedure FinalClass; static;
    constructor Create(ordinal: Integer; bits: Integer; name: string);
  public
    class function forBits(bits: Integer): TErrorCorrectionLevel; static;
    class function forName(name: string): TErrorCorrectionLevel; static;
    class var
      H: TErrorCorrectionLevel;
    class var
      L: TErrorCorrectionLevel;
    class var
      M: TErrorCorrectionLevel;
    class var
      Q: TErrorCorrectionLevel;
    function ordinal: Integer;
    function ToString: string; override;
    property bits: Integer read Fbits;
    property Name: string read Fname;
  end;

implementation

class procedure TErrorCorrectionLevel.InitClass;
begin
  H := TErrorCorrectionLevel.Create(3, 2, 'H');
  L := TErrorCorrectionLevel.Create(0, 1, 'L');
  M := TErrorCorrectionLevel.Create(1, 0, 'M');
  Q := TErrorCorrectionLevel.Create(2, 3, 'Q');

  FOR_BITS := TArray<TErrorCorrectionLevel>.Create(M, L, H, Q);
end;

class procedure TErrorCorrectionLevel.FinalClass;
begin
  H.FOR_BITS := nil;
  L.FOR_BITS := nil;
  M.FOR_BITS := nil;
  Q.FOR_BITS := nil;

  FreeAndNil(H);
  FreeAndNil(L);
  FreeAndNil(M);
  FreeAndNil(Q);
  FOR_BITS := nil;
end;

constructor TErrorCorrectionLevel.Create(ordinal, bits: Integer; name: string);
begin
  Fordinal_Renamed_Field := ordinal;
  Fbits := bits;
  Fname := name
end;

class function TErrorCorrectionLevel.forBits(bits: Integer): TErrorCorrectionLevel;
begin
  if ((bits < 0) or (bits >= Length(TErrorCorrectionLevel.FOR_BITS))) then
    raise EArgumentException.Create('');
  begin
    Result := TErrorCorrectionLevel.FOR_BITS[bits];
    exit
  end
end;

class function TErrorCorrectionLevel.forName(name: string): TErrorCorrectionLevel;
begin
  Result := nil;
  if name = 'H' then
  begin
    Result := H;
  end
  else if name = 'L' then
  begin
    Result := L;
  end
  else if name = 'M' then
  begin
    Result := M;
  end
  else if name = 'Q' then
  begin
    Result := Q;
  end;
end;

function TErrorCorrectionLevel.ordinal: Integer;
begin
  Result := Fordinal_Renamed_Field
end;

function TErrorCorrectionLevel.ToString: string;
begin
  Result := Fname
end;

initialization
  TErrorCorrectionLevel.InitClass;

finalization
  TErrorCorrectionLevel.FinalClass;

end.

