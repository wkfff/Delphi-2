unit frmConvertTo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.ComCtrls,
  Vcl.StdCtrls, VGCore_TLB;

type
  TfConvertTo = class(TTBaseForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    btn1: TButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConvertToCurves; overload;
    procedure ConvertToCurves(page: IVGPage); overload;
    procedure ConvertToCurves(ss: IVGShapes); overload;
  public
    { Public declarations }
  end;

var
  fConvertTo: TfConvertTo;

implementation

{$R *.dfm}

procedure TfConvertTo.ConvertToCurves;
var
  I: Integer;
begin
  self.cmdName := '����ת��';
  StartEvent(True);
  if rb1.Checked then
  begin
    ConvertToCurves(mApp.ActivePage);
  end
  else
  begin
    for I := 1 to mApp.ActiveDocument.Pages.Count do
    begin
      ConvertToCurves(mApp.ActiveDocument.Pages[I]);
    end;
  end;
  EndEvent;
  MessageBox(Handle, '����������ת����', '��ʾ', MB_OK + MB_ICONINFORMATION);
end;

procedure TfConvertTo.ConvertToCurves(page: IVGPage);
begin
  ConvertToCurves(page.Shapes);
end;

procedure TfConvertTo.btn1Click(Sender: TObject);
begin
  inherited;
  TThread.CreateAnonymousThread(
    procedure
    begin
      ConvertToCurves;
    end).Start;
end;

procedure TfConvertTo.ConvertToCurves(ss: IVGShapes);
var
  ss1: IVGShapeRange;
  I: Integer;
begin
  ss1 := ss.FindShapes('', cdrTextShape, True, '');
  for I := 1 to ss.Count do
  begin
    ss[I].ConvertToCurves;
  end;
  ss1 := ss.FindShapes('', 0, True, '@com.PowerClip <> null');
  for I := 1 to ss.Count do
  begin
    ConvertToCurves(ss1.Shapes);
  end;
end;

end.
