unit fPerfTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.Bind.GenData,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Vcl.ComCtrls;

type
  TFormPerfTest = class(TForm)
    TestData: TClientDataSet;
    ButtonRun: TButton;
    Iterations: TEdit;
    Fields: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Timings: TRichEdit;
    procedure ButtonRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FVersion : string;
    procedure Loop(const AFields: integer; const ACount : integer);
    procedure CreateDataset(const AFields: integer);

  public
    { Public declarations }
  end;

var
  FormPerfTest: TFormPerfTest;

implementation

{$R *.dfm}

uses
  System.IOUtils, System.Diagnostics, Math;

procedure TFormPerfTest.ButtonRunClick(Sender: TObject);
begin
  Loop(StrToInt(Fields.Text), StrToInt(Iterations.Text));
end;

procedure TFormPerfTest.FormCreate(Sender: TObject);
begin
  Randomize;
  {$ifdef VER300}
  FVersion := 'DXS';
  {$else}
  FVersion := 'XE8';
  {$endif}
end;

procedure TFormPerfTest.Loop(const AFields: integer; const ACount: integer);
var
  timer : TStopWatch;
  good, bad : Int64;
  goodname : string;
  fld : TField;
  I: Integer;

begin
  CreateDataset(AFields);
  goodname := TestData.Fields[TestData.FieldCount - 1].FieldName;
  timer := TStopWatch.StartNew;
  for I := 1 to ACount do
  begin
    goodname := TestData.Fields[RandomRange(0,AFields)].FieldName;
    fld := TestData.FindField(goodname);
  end;
  timer.Stop;
  good := timer.ElapsedTicks;
  timer := TStopWatch.StartNew;
  for i := 1 to ACount do
  begin
    fld := TestData.FindField('__badname__');
  end;
  timer.Stop;
  bad := timer.ElapsedTicks;
  Timings.Lines.Add(Format('%s %d fields %d times, Found: %d ticks Not found: %d ticks',
    [FVersion, TestData.FieldCount, ACount, good, bad]));
end;

procedure TFormPerfTest.CreateDataset(const AFields: integer);
const
  FldTypes : array of TFieldType = [ TFieldType.ftString, TFieldType.ftLargeInt,
    TFieldType.ftCurrency, TFieldType.ftDateTime ];
var
  maxTypes : integer;
  target : TFieldType;
  i : integer;

  procedure CreateRandomField(n: integer);
  begin
    target := FldTypes[RandomRange(0, maxTypes)];

    case target of
      TFieldType.ftString: TestData.FieldDefs.Add(Format('String%d',[n]), target, 60);
      TFieldType.ftLargeInt: TestData.FieldDefs.Add(Format('Integer%d',[n]), target);
      TFieldType.ftCurrency: TestData.FieldDefs.Add(Format('Currency%d',[n]), target);
      TFieldType.ftDateTime: TestData.FieldDefs.Add(Format('DateTime%d',[n]), target);
    end;
  end;

begin
  maxTypes := Length(FldTypes);
  TestData.Close;
  TestData.FieldDefs.Clear;
  for I := 1 to AFields do
    CreateRandomField(I);
  TestData.CreateDataSet;

end;

end.
