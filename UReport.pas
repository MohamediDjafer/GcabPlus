unit UReport;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, frxBarcode;

type
  TFSTReport = class(TDataModule)
    frxCarteSoin: TfrxReport;
    frxDBPatient: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FSTReport: TFSTReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UData;

{$R *.dfm}

end.
