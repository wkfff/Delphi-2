program GMS�ƽ�;

{$R *.dres}

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  MyUtils in 'MyUtils.pas',
  Vcl.Themes,
  Vcl.Styles,
  DragControl in '..\�ؼ���\DragControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
