program ֤���մ���;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  GdiPlus in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlus.pas',
  GdiPlusHelpers in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlusHelpers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
