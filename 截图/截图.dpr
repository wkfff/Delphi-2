program ��ͼ;

{$R *.dres}

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  CaptureImageTool in 'CaptureImageTool.pas' {Form2},
  Operate in 'Operate.pas',
  GdiPlus in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlus.pas',
  GdiPlusHelpers in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlusHelpers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TTCaptureImageTool, TCaptureImageTool);
  Application.Run;
end.
