unit UAntece;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, AdvEdit, advlued,
  GradientLabel, AdvGlowButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFAntece = class(TForm)
    DBAdvGrid3: TDBAdvGrid;
    BTN_Apply: TAdvGlowButton;
    BTN_Cancel: TAdvGlowButton;
    GradientLabel73: TGradientLabel;
    AdvLUEdit4: TAdvLUEdit;
    GradientLabel456: TGradientLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvLUEdit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
 procedure searchp(EDT : TAdvLUEdit; FLT : TFDQuery; DFLT : TDataSource; dbgrid : TDBAdvGrid);
  end;

var
  FAntece: TFAntece;

implementation

uses UData,UMain,UBLK,UAdd_Pat;
{$R *.dfm}


procedure TFAntece.searchp(EDT : TAdvLUEdit; FLT : TFDQuery; DFLT : TDataSource; dbgrid : TDBAdvGrid);
  var
    List,List1,List2,List3: TStrings;
    i: integer;
    typ : string;
  begin

    List := TStringList.Create;
    List1 := TStringList.Create;
    List2 := TStringList.Create;
    List3 := TStringList.Create;

    ExtractStrings([' '], [], PChar(EDT.Text), List);
    ExtractStrings(['/'], [], PChar(List.Text), List1);
    ExtractStrings(['*'], [], PChar(List1.Text), List2);
    ExtractStrings(['-'], [], PChar(List2.Text), List3);

    if EDT.Text <> '' then
      begin
        with List3 do
          begin
            FLT.SQL.Clear;
            FLT.SQL.Add('SELECT * FROM ');

            if GradientLabel73.Hint = 'Antécédents Médicaux' then
              FLT.SQL.Add('VAnte_M');
            if GradientLabel73.Hint = 'Antécédents Chirurgicaux' then
              FLT.SQL.Add('VAnte_CH');
            if GradientLabel73.Hint = 'Antécédents Familliaux' then
              FLT.SQL.Add('VAnte_F');
            if GradientLabel73.Hint = 'Autres Antécédents' then
              FLT.SQL.Add('VAnte_A');

            FLT.SQL.Add(' WHERE ANTECE like ' +QuotedStr('%' + KeyNames[0] + '%') + '');

            if count > 1 then
            for i := 1 to Count-1 do
              begin
                flt.SQL.Add(' and ANTECE like ' + QuotedStr('%' + KeyNames[i] +'%') + '');
              end;

            FLT.Open;
            dbgrid.DataSource := DFLT;

          end;
      end
    else
      begin
        if GradientLabel73.Hint = 'Antécédents Médicaux' then
          dbgrid.DataSource := FData.DAnte_M;
        if GradientLabel73.Hint = 'Antécédents Chirurgicaux' then
          dbgrid.DataSource := FData.DAnte_CH;
        if GradientLabel73.Hint = 'Antécédents Familliaux' then
          dbgrid.DataSource := FData.DAnte_F;
        if GradientLabel73.Hint = 'Autres Antécédents' then
          dbgrid.DataSource := FData.DAnte_A;
      end;

end;

procedure TFAntece.AdvLUEdit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
searchp(AdvLUEdit4,FData.FILT,FData.DFILT,DBAdvGrid3);
end;

procedure TFAntece.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FAdd_Pat.Show;
DBAdvGrid3.DataSource := FData.vide;
end;

end.
