program ͼ�����;

{$R *.dres}

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  CUtils in 'CUtils.pas',
  ArrayEx in 'ArrayEx.pas',
  Icon2Base64 in '..\ͼ��Base64����\Icon2Base64.pas',
  IconsToFile in 'IconsToFile.pas';

{$R *.res}



begin
  //ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

