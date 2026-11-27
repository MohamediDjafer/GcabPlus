unit UAdd_Dep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.StdCtrls, AdvEdit,
  advlued, GradientLabel;

type
  TFAdd_Dep = class(TForm)
    GradientLabel15: TGradientLabel;
    GradientLabel14: TGradientLabel;
    GradientLabel1: TGradientLabel;
    INSERT_DESI: TAdvLUEdit;
    GradientLabel2: TGradientLabel;
    AdvLUEdit1: TAdvLUEdit;
    AdvLUEdit2: TAdvLUEdit;
    GradientLabel3: TGradientLabel;
    BTN_Apply: TAdvGlowButton;
    BTN_Cancel: TAdvGlowButton;
    GradientLabel4: TGradientLabel;
    AdvLUEdit3: TAdvLUEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdd_Dep: TFAdd_Dep;

implementation

{$R *.dfm}

end.
