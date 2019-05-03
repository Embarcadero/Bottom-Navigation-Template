unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  System.Rtti,
  ufrmBasic, ufrmShifting, ufrmLight, ufrmDark, ufrmIcon, ufrmPrimary,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList,
  FMX.ImgList, FMX.Edit, FMX.Ani, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Gestures,
  FMX.TabControl, FMX.MultiView;

type
  TfrmMain = class(TForm)
    StyleBookMain: TStyleBook;
    ImageListButtons: TImageList;
    LayoutContent: TLayout;
    PanelMenu: TPanel;
    btnMenu: TButton;
    FloatAnimationbtnMenu: TFloatAnimation;
    mvSliderMenu: TMultiView;
    lbMainMenu: TListBox;
    lbiBasic: TListBoxItem;
    lbiShifting: TListBoxItem;
    lbiLight: TListBoxItem;
    lbiDark: TListBoxItem;
    lbiIcon: TListBoxItem;
    lbiPrimary: TListBoxItem;
    lbiMapBlue: TListBoxItem;
    lbiLightSimple: TListBoxItem;
    procedure btnMenuClick(Sender: TObject);
    procedure ListBoxItemClick(Sender: TObject);
  private
    {}
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  if not mvSliderMenu.IsShowed then
    mvSliderMenu.ShowMaster
  else
    mvSliderMenu.HideMaster;
end;

procedure TfrmMain.ListBoxItemClick(Sender: TObject);
begin
  case TListBoxItem(Sender).Tag of
    0:
      ShowBasicForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
    1:
      ShowShiftingForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
    2:
      ShowLightForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
    3:
      ShowDarkForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
    4:
      ShowIconForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
    5:
      ShowPrimaryForm().RunDialog(
        procedure()
        begin
          mvSliderMenu.HideMaster;
        end
      );
  end;
end;

end.

