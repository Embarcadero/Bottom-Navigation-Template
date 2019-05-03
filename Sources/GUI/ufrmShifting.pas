unit ufrmShifting;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FMX.Edit, FMX.Ani, FMX.StdCtrls, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.TabControl, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, FMX.ImgList;

type
  TfrmShifting = class(TForm)
    ImageListTopLBImages: TImageList;
    FDMemTable1: TFDMemTable;
    FDMemTable1Text: TStringField;
    FDMemTable1Text2: TStringField;
    FDMemTable1Image: TBlobField;
    FDMemTable1ID: TIntegerField;
    StyleBookShifting: TStyleBook;
    FDMemTable2: TFDMemTable;
    StringField3: TStringField;
    BlobField2: TBlobField;
    IntegerField2: TIntegerField;
    ImageList3Parts: TImageList;
    FDMemTable3: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    BlobField1: TBlobField;
    IntegerField1: TIntegerField;
    tFormShowed: TTimer;
    ImageListButtons: TImageList;
    LayoutContent: TLayout;
    VertScrollBoxMain: TVertScrollBox;
    Layout4: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    GridPanelLayoutMain: TGridPanelLayout;
    Layout1: TLayout;
    LabelGroupCaption1: TLabel;
    btnMore1: TButton;
    ListBoxTopTab1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Layout2: TLayout;
    LabelGroupCaption2: TLabel;
    btnMore2: TButton;
    ListBox3PartsTab1: TListBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Layout3: TLayout;
    LabelGroupCaption3: TLabel;
    btnMore3: TButton;
    ListBoxBottomTab1: TListBox;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    TabItem2: TTabItem;
    GridPanelLayout2: TGridPanelLayout;
    Layout5: TLayout;
    Label1: TLabel;
    Button2: TButton;
    ListBoxTopTab2: TListBox;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    Layout6: TLayout;
    Label2: TLabel;
    Button3: TButton;
    ListBox3PartsTab2: TListBox;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    Layout7: TLayout;
    Label3: TLabel;
    Button4: TButton;
    ListBoxBottomTab2: TListBox;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    TabItem3: TTabItem;
    GridPanelLayout3: TGridPanelLayout;
    Layout8: TLayout;
    Label4: TLabel;
    Button5: TButton;
    ListBoxTopTab3: TListBox;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    Layout9: TLayout;
    Label5: TLabel;
    Button6: TButton;
    ListBox3PartsTab3: TListBox;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    Layout10: TLayout;
    Label6: TLabel;
    Button7: TButton;
    ListBoxBottomTab3: TListBox;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    PanelBottom: TPanel;
    animateBottom: TFloatAnimation;
    PanelTop: TPanel;
    PanelMenu: TPanel;
    btnMenu: TButton;
    FloatAnimationbtnMenu: TFloatAnimation;
    Button1: TButton;
    FloatAnimationbtnMic: TFloatAnimation;
    eSearch: TEdit;
    animateTop: TFloatAnimation;
    btnMovie: TButton;
    ColorAnimation1: TColorAnimation;
    btnMusic: TButton;
    ColorAnimation2: TColorAnimation;
    btnBooks: TButton;
    ColorAnimation3: TColorAnimation;
    btnNewsstand: TButton;
    ColorAnimation4: TColorAnimation;
    FloatAnimationMovie: TFloatAnimation;
    FloatAnimationMusic: TFloatAnimation;
    FloatAnimationBook: TFloatAnimation;
    FloatAnimationNewsstand: TFloatAnimation;
    TabItem4: TTabItem;
    GridPanelLayout4: TGridPanelLayout;
    Layout11: TLayout;
    Label7: TLabel;
    Button8: TButton;
    ListBoxTopTab4: TListBox;
    ListBoxItem22: TListBoxItem;
    ListBoxItem23: TListBoxItem;
    Layout12: TLayout;
    Label8: TLabel;
    Button9: TButton;
    ListBox3PartsTab4: TListBox;
    ListBoxItem24: TListBoxItem;
    ListBoxItem25: TListBoxItem;
    ListBoxItem26: TListBoxItem;
    Layout13: TLayout;
    Label9: TLabel;
    Button10: TButton;
    ListBoxBottomTab4: TListBox;
    ListBoxItem27: TListBoxItem;
    ListBoxItem28: TListBoxItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBottomMenuClick(Sender: TObject);
    procedure tFormShowedTimer(Sender: TObject);
    procedure VertScrollBoxMainViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
    procedure eSearchEnter(Sender: TObject);
    procedure eSearchExit(Sender: TObject);
  private
    FSuccProc: TProc;
    FBarsIsShowing: Boolean;
    FOldClicedButtonIndex: Integer;
    FCurMenuButtonWidth: Single;
    FMaxMenuButtonWidth: Single;
    FMinMenuButtonWidth: Single;

    procedure InsertTestDataToTheMemTables();

    procedure LoadTopListboxItems(aListBox: TListBox);
    procedure Load3PartsListboxItems(aListBox: TListBox);
    procedure LoadBottomListboxItems(aListBox: TListBox);

    procedure ListBoxTopItemClick(Sender: TObject);
    procedure ListBoxItemButtonClick(Sender: TObject);
    procedure ListBox3PartsItemClick(Sender: TObject);
    procedure ListBoxBottomItemClick(Sender: TObject);
  public
    function RunDialog(const SuccProc: TProc): string;
  end;

  function ShowShiftingForm(): TfrmShifting;

var
  frmShifting: TfrmShifting;

implementation

{$R *.fmx}

function ShowShiftingForm(): TfrmShifting;
begin
  if Assigned(frmShifting) then
    frmShifting.Free;

  frmShifting:= TfrmShifting.Create(Application);
  with frmShifting do
  begin

  end;

  Result:= frmShifting;
end;

function TfrmShifting.RunDialog(const SuccProc: TProc): string;
begin
  FSuccProc:= SuccProc;
  {$IF DEFINED(Win64) or DEFINED(Win32)}
  ShowModal;
  {$ELSE}
  Self.Show;
  {$ENDIF}
end;

procedure TfrmShifting.FormShow(Sender: TObject);
begin
  InsertTestDataToTheMemTables();

  FBarsIsShowing:= True;
  FOldClicedButtonIndex:= -1;

  tFormShowed.Enabled:= True;
end;

procedure TfrmShifting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSuccProc) then
  begin
    FSuccProc();
    FSuccProc:= nil;
  end;
end;

procedure TfrmShifting.btnBottomMenuClick(Sender: TObject);

  procedure MakeAnimation(aMovie: Boolean = False; aMusic: Boolean = False; aBook: Boolean = False; aNewsstand: Boolean = False);

    procedure StartAnimation(aButton: TButton = nil);
    var
      lAnimane: TFloatAnimation;
    begin
      if Assigned(aButton) then
      begin
        lAnimane:= aButton.FindStyleResource('mtfanim') as  TFloatAnimation;

        if Assigned(lAnimane) then
          lAnimane.Start;
      end;

    end;

  begin
    if FOldClicedButtonIndex <> TFmxObject(Sender).Tag then
    begin
      FloatAnimationMovie.Inverse:= aMovie;
      FloatAnimationMovie.Start;

      FloatAnimationMusic.Inverse:= aMusic;
      FloatAnimationMusic.Start;

      FloatAnimationBook.Inverse:= aBook;
      FloatAnimationBook.Start;

      FloatAnimationNewsstand.Inverse:= aNewsstand;
      FloatAnimationNewsstand.Start;

      btnMovie.StylesData['mtfanim.Inverse']:= aMovie;
      StartAnimation(btnMovie);

      btnMusic.StylesData['mtfanim.Inverse']:= aMusic;
      StartAnimation(btnMusic);

      btnBooks.StylesData['mtfanim.Inverse']:= aBook;
      StartAnimation(btnBooks);

      btnNewsstand.StylesData['mtfanim.Inverse']:= aNewsstand;
      StartAnimation(btnNewsstand);
    end;
  end;

begin
  eSearch.TextPrompt:= TButton(Sender).Text;

  TabControl1.TabIndex:= TFmxObject(Sender).Tag;

  case TFmxObject(Sender).Tag of
    0:
      begin
//        MakeAnimation(False, True, True, True);

        LoadTopListboxItems(ListBoxTopTab1);
        Load3PartsListboxItems(ListBox3PartsTab1);
        LoadBottomListboxItems(ListBoxBottomTab1);
      end;
    1:
      begin
//        MakeAnimation(True, False, True, True);

        LoadTopListboxItems(ListBoxTopTab2);
        Load3PartsListboxItems(ListBox3PartsTab2);
        LoadBottomListboxItems(ListBoxBottomTab2);
      end;
    2:
      begin
//        MakeAnimation(True, True, False, True);

        LoadTopListboxItems(ListBoxTopTab3);
        Load3PartsListboxItems(ListBox3PartsTab3);
        LoadBottomListboxItems(ListBoxBottomTab3);
      end;
    3:
      begin
//        MakeAnimation(True, True, True, False);

        LoadTopListboxItems(ListBoxTopTab4);
        Load3PartsListboxItems(ListBox3PartsTab4);
        LoadBottomListboxItems(ListBoxBottomTab4);
      end;
  end;
  FOldClicedButtonIndex:= TFmxObject(Sender).Tag;
end;

procedure TfrmShifting.tFormShowedTimer(Sender: TObject);
begin
  if Width > 0 then
  begin
    tFormShowed.Enabled:= False;

    LoadTopListboxItems(ListBoxTopTab1);
    Load3PartsListboxItems(ListBox3PartsTab1);
    LoadBottomListboxItems(ListBoxBottomTab1);

    FCurMenuButtonWidth:= (PanelBottom.Width - 8) / 4;
    FMaxMenuButtonWidth:= FCurMenuButtonWidth + 100;
    FMinMenuButtonWidth:= (PanelBottom.Width - FMaxMenuButtonWidth) / 3;

    btnMovie.Width:= FMinMenuButtonWidth;
    btnMusic.Width:= FMinMenuButtonWidth;
    btnBooks.Width:= FMinMenuButtonWidth;
    btnNewsstand.Width:= FMinMenuButtonWidth;

    FloatAnimationMovie.StartValue:= FMinMenuButtonWidth;
    FloatAnimationMovie.StopValue:= FMaxMenuButtonWidth;

    FloatAnimationMusic.StartValue:= FMinMenuButtonWidth;
    FloatAnimationMusic.StopValue:= FMaxMenuButtonWidth;

    FloatAnimationBook.StartValue:= FMinMenuButtonWidth;
    FloatAnimationBook.StopValue:= FMaxMenuButtonWidth;

    FloatAnimationNewsstand.StartValue:= FMinMenuButtonWidth;
    FloatAnimationNewsstand.StopValue:= FMaxMenuButtonWidth;

//    btnBottomMenuClick(btnMovie);
    btnMovie.SetFocus;
  end;
end;

procedure TfrmShifting.InsertTestDataToTheMemTables();
var
  lMemoryStream: TMemoryStream;
begin
  {$region ' for top listbox '}
  FDMemTable1.Open;

  // First item
  FDMemTable1.Insert;
  FDMemTable1.FieldByName('ID').AsInteger:= 1;
  FDMemTable1.FieldByName('Text').AsString:= 'Mauris sagittis name';
  FDMemTable1.FieldByName('Text2').AsString:= 'Kodaline';

  lMemoryStream := TMemoryStream.Create;
  try
    ImageListTopLBImages.Source[0].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable1.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable1.Post;

  // Second item
  FDMemTable1.Insert;
  FDMemTable1.FieldByName('ID').AsInteger:= 2;
  FDMemTable1.FieldByName('Text').AsString:= 'Aliquam';
  FDMemTable1.FieldByName('Text2').AsString:= 'One Republic';

  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListTopLBImages.Source[1].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable1.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable1.Post;
  {$endregion}

  {$region ' for center listbox '}
  FDMemTable2.Open;

  // First item
  FDMemTable2.Insert;
  FDMemTable2.FieldByName('ID').AsInteger:= 1;
  FDMemTable2.FieldByName('Text').AsString:= 'Curabitur template';
  lMemoryStream:= TMemoryStream.Create;
  try
    ImageList3Parts.Source[0].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable2.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable2.Post;

  // Second item
  FDMemTable2.Insert;
  FDMemTable2.FieldByName('ID').AsInteger:= 2;
  FDMemTable2.FieldByName('Text').AsString:= 'Quisque';
  lMemoryStream:= TMemoryStream.Create;
  try
    ImageList3Parts.Source[1].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable2.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable2.Post;

  // Third item
  FDMemTable2.Insert;
  FDMemTable2.FieldByName('ID').AsInteger:= 3;
  FDMemTable2.FieldByName('Text').AsString:= 'Aliquam academy';

  lMemoryStream:= TMemoryStream.Create;
  try
    ImageList3Parts.Source[2].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable2.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable2.Post;
  {$endregion}

  {$region ' for bottom listbox '}
  FDMemTable3.Open;

  // First item
  FDMemTable3.Insert;
  FDMemTable3.FieldByName('ID').AsInteger:= 1;
  FDMemTable3.FieldByName('Text').AsString:= 'Suspendisse ornament';
  FDMemTable3.FieldByName('Text2').AsString:= 'Adipiscing';

  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListTopLBImages.Source[0].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable3.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable3.Post;

  // Second item
  FDMemTable3.Insert;
  FDMemTable3.FieldByName('ID').AsInteger:= 2;
  FDMemTable3.FieldByName('Text').AsString:= 'Placerat vel ipsum';
  FDMemTable3.FieldByName('Text2').AsString:= 'Amet Rutrum';

  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListTopLBImages.Source[1].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTable3.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTable3.Post;
  {$endregion}
end;

procedure TfrmShifting.LoadTopListboxItems(aListBox: TListBox);
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  aListBox.BeginUpdate;
  try
    aListBox.Clear;

    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      lLBItem:= TListBoxItem.Create(nil);
      lLBItem.StyleLookup:= 'ListboxItemBigImageStyle';

      lLBItem.Width:= (Width - 25) / 2;
      lLBItem.Tag:= FDMemTable1.FieldByName('ID').AsInteger;
      lLBItem.Text:= FDMemTable1.FieldByName('Text').AsString;
      lLBItem.StylesData['Text2.Text']:= FDMemTable1.FieldByName('Text2').AsString;

      {$region ' Load image to stream '}
      lMemoryStream:= TMemoryStream.Create;
      try
        (FDMemTable1.FieldByName('Image') as TBlobField).SaveToStream(lMemoryStream);
        lLBItem.ItemData.Bitmap:= TBitmap.CreateFromStream(lMemoryStream);
      finally
        lMemoryStream.Free;
      end;
      {$endregion}

      lLBItem.StylesData['Button.Tag']:= FDMemTable1.FieldByName('ID').AsInteger;
      lLBItem.StylesData['Button.Images']:= TValue.From<TImageList>(ImageListButtons);
      lLBItem.StylesData['Button.ImageIndex']:= 1;
      lLBItem.StylesData['Button.OnClick']:= TValue.From<TNotifyEvent>(ListBoxItemButtonClick);

      lLBItem.OnClick:= ListBoxTopItemClick;

      aListBox.AddObject(lLBItem);

      FDMemTable1.Next;
    end;
  finally
    aListBox.EndUpdate;
  end;
end;

procedure TfrmShifting.ListBoxTopItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmShifting.ListBoxItemButtonClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmShifting.Load3PartsListboxItems(aListBox: TListBox);
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  aListBox.BeginUpdate;
  try
    aListBox.Clear;

    FDMemTable2.First;
    while not FDMemTable2.Eof do
    begin
      lLBItem:= TListBoxItem.Create(nil);
      lLBItem.StyleLookup:= 'ListboxItem3PartsStyle';

      lLBItem.Width:= (Width - 25) / 3;
      lLBItem.Tag:= FDMemTable2.FieldByName('ID').AsInteger;
      lLBItem.Text:= FDMemTable2.FieldByName('Text').AsString;

      {$region ' Load image to stream '}
      lMemoryStream:= TMemoryStream.Create;
      try
        (FDMemTable2.FieldByName('Image') as TBlobField).SaveToStream(lMemoryStream);
        lLBItem.ItemData.Bitmap:= TBitmap.CreateFromStream(lMemoryStream);
      finally
        lMemoryStream.Free;
      end;
      {$endregion}

      lLBItem.StylesData['Button.Tag']:= FDMemTable2.FieldByName('ID').AsInteger;
      lLBItem.StylesData['Button.Images']:= TValue.From<TImageList>(ImageListButtons);
      lLBItem.StylesData['Button.ImageIndex']:= 1;
      lLBItem.StylesData['Button.OnClick']:= TValue.From<TNotifyEvent>(ListBoxItemButtonClick);

      lLBItem.OnClick:= ListBox3PartsItemClick;

      aListBox.AddObject(lLBItem);

      FDMemTable2.Next;
    end;
  finally
    aListBox.EndUpdate;
  end;
end;

procedure TfrmShifting.ListBox3PartsItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmShifting.LoadBottomListboxItems(aListBox: TListBox);
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  aListBox.BeginUpdate;
  try
    aListBox.Clear;

    FDMemTable3.First;
    while not FDMemTable3.Eof do
    begin
      lLBItem:= TListBoxItem.Create(nil);
      lLBItem.StyleLookup:= 'ListboxItemBigImageStyle';

      lLBItem.Width:= (Width - 25) / 2;
      lLBItem.Tag:= FDMemTable3.FieldByName('ID').AsInteger;
      lLBItem.Text:= FDMemTable3.FieldByName('Text').AsString;
      lLBItem.StylesData['Text2.Text']:= FDMemTable3.FieldByName('Text2').AsString;

      {$region ' Load image to stream '}
      lMemoryStream:= TMemoryStream.Create;
      try
        (FDMemTable3.FieldByName('Image') as TBlobField).SaveToStream(lMemoryStream);
        lLBItem.ItemData.Bitmap:= TBitmap.CreateFromStream(lMemoryStream);
      finally
        lMemoryStream.Free;
      end;
      {$endregion}

      lLBItem.StylesData['Button.Tag']:= FDMemTable3.FieldByName('ID').AsInteger;
      lLBItem.StylesData['Button.Images']:= TValue.From<TImageList>(ImageListButtons);
      lLBItem.StylesData['Button.ImageIndex']:= 1;
      lLBItem.StylesData['Button.OnClick']:= TValue.From<TNotifyEvent>(ListBoxItemButtonClick);

      lLBItem.OnClick:= ListBoxBottomItemClick;

      aListBox.AddObject(lLBItem);

      FDMemTable3.Next;
    end;
  finally
    aListBox.EndUpdate;
  end;
end;

procedure TfrmShifting.ListBoxBottomItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmShifting.VertScrollBoxMainViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);

  procedure DoAnimate(AVisible: Boolean);
  begin
    animateBottom.Inverse:= AVisible;
    animateBottom.Start;

    animateTop.Inverse:= AVisible;
    animateTop.Start;
  end;

begin
    if FBarsIsShowing and (NewViewportPosition.Y > OldViewportPosition.Y) then
    begin
      FBarsIsShowing:= False;
      DoAnimate(FBarsIsShowing);
    end else
    if not FBarsIsShowing and (NewViewportPosition.Y < OldViewportPosition.Y) then
    begin
      FBarsIsShowing:= True;
      DoAnimate(FBarsIsShowing);
    end;
end;

procedure TfrmShifting.eSearchEnter(Sender: TObject);
begin
  eSearch.TextPrompt:= 'Search';

  FloatAnimationbtnMenu.Inverse:= False;
  FloatAnimationbtnMenu.Start;

  FloatAnimationbtnMic.Inverse:= False;
  FloatAnimationbtnMic.Start;
end;

procedure TfrmShifting.eSearchExit(Sender: TObject);
begin
  FloatAnimationbtnMenu.Inverse:= True;
  FloatAnimationbtnMenu.Start;

  FloatAnimationbtnMic.Inverse:= True;
  FloatAnimationbtnMic.Start;
end;

end.
