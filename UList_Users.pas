unit UList_Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, AdvEdit, advlued,
  AdvMetroButton, GradientLabel, AdvGlowButton, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid;

type
  TFList_Users = class(TForm)
    DBAdvGrid3: TDBAdvGrid;
    BTN_Apply: TAdvGlowButton;
    GradientLabel14: TGradientLabel;
    GradientLabel15: TGradientLabel;
    AdvLUEdit4: TAdvLUEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBAdvGrid3GetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FList_Users: TFList_Users;

implementation

uses UData,UAdd_Consu;

{$R *.dfm}

procedure TFList_Users.DBAdvGrid3GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  with DBAdvGrid3 do
    with FData.TUsers do
      begin
        if ARow = GetRealRow then // To affect changes to the selected Row only
          begin
            SelectionColor := $009DD8F9;
            SelectionColorTo := $005EC1F1;
            AFont.Size := 12;
            AFont.Style := [fsBold];
          end;
      end;
end;

procedure TFList_Users.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FAdd_Consu.Show;
end;

end.
