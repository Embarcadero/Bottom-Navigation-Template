unit ufrmMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  System.ImageList,
  FMX.ImgList,
  FMX.Edit,
  FMX.Ani,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FMX.Gestures, FMX.MultiView, FMX.TabControl;

type
  TMyVertScrollBox = class(TVertScrollBox)
  end;

  TfrmMain = class(TForm)
    StyleBook1: TStyleBook;
    ImageListButtons: TImageList;
    ImageListTopLBImages: TImageList;
    ImageList3Parts: TImageList;
    FDMemTable1: TFDMemTable;
    FDMemTable1Text: TStringField;
    FDMemTable1Text2: TStringField;
    FDMemTable1Image: TBlobField;
    FDMemTable1ID: TIntegerField;
    FDMemTable3: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    BlobField1: TBlobField;
    IntegerField1: TIntegerField;
    FDMemTable2: TFDMemTable;
    StringField3: TStringField;
    BlobField2: TBlobField;
    IntegerField2: TIntegerField;
    tFormShowed: TTimer;
    LayoutContent: TLayout;
    VertScrollBoxMain: TVertScrollBox;
    GridPanelLayoutMain: TGridPanelLayout;
    Layout1: TLayout;
    LabelGroupCaption1: TLabel;
    btnMore1: TButton;
    ListBoxTop: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Layout2: TLayout;
    LabelGroupCaption2: TLabel;
    btnMore2: TButton;
    ListBox3Parts: TListBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Layout3: TLayout;
    LabelGroupCaption3: TLabel;
    btnMore3: TButton;
    ListBoxBottom: TListBox;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    Layout4: TLayout;
    PanelBottom: TPanel;
    GridPanelLayout1: TGridPanelLayout;
    btnRecents: TButton;
    ColorAnimation1: TColorAnimation;
    btnFavorites: TButton;
    ColorAnimation2: TColorAnimation;
    btnNearby: TButton;
    ColorAnimation3: TColorAnimation;
    animateBottom: TFloatAnimation;
    PanelMenu: TPanel;
    btnMenu: TButton;
    Button1: TButton;
    eSearch: TEdit;
    animateTop: TFloatAnimation;
    FloatAnimationbtnMenu: TFloatAnimation;
    FloatAnimationbtnMic: TFloatAnimation;
    MultiView1: TMultiView;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    layoutTop: TLayout;
    Button2: TButton;
    ColorAnimation4: TColorAnimation;
    Button3: TButton;
    ColorAnimation5: TColorAnimation;
    Button4: TButton;
    ColorAnimation6: TColorAnimation;
    Label1: TLabel;
    Nearby: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnBottomMenuClick(Sender: TObject);
    procedure VertScrollBoxMainViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
    procedure eSearchEnter(Sender: TObject);
    procedure eSearchExit(Sender: TObject);
    procedure tFormShowedTimer(Sender: TObject);
  private
    FBarsIsShowing: Boolean;

    procedure InsertTestDataToTheMemTables();
    procedure LoadTopListboxItems();
    procedure Load3PartsListboxItems();
    procedure LoadBottomListboxItems();
    procedure ListBoxTopItemClick(Sender: TObject);
    procedure ListBoxItemButtonClick(Sender: TObject);
    procedure ListBox3PartsItemClick(Sender: TObject);
    procedure ListBoxBottomItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnBottomMenuClick(Sender: TObject);
begin
  eSearch.TextPrompt:= TButton(Sender).Text;

  LoadTopListboxItems();
  Load3PartsListboxItems();
  LoadBottomListboxItems();
  MultiView1.HideMaster;

  TabControl1.TabIndex := TFmxObject(Sender).Tag;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InsertTestDataToTheMemTables();

  FBarsIsShowing:= True;

  tFormShowed.Enabled:= True;

//  LoadTopListboxItems();
//  Load3PartsListboxItems();
//  LoadBottomListboxItems();
end;

procedure TfrmMain.InsertTestDataToTheMemTables();
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

procedure TfrmMain.LoadTopListboxItems();
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  ListBoxTop.BeginUpdate;
  try
    ListBoxTop.Clear;

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

      ListBoxTop.AddObject(lLBItem);

      FDMemTable1.Next;
    end;
  finally
    ListBoxTop.EndUpdate;
  end;
end;

procedure TfrmMain.tFormShowedTimer(Sender: TObject);
begin
  if Width > 0 then
  begin
    tFormShowed.Enabled:= False;

    LoadTopListboxItems();
    Load3PartsListboxItems();
    LoadBottomListboxItems();
  end;
end;

procedure TfrmMain.ListBoxTopItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmMain.ListBoxItemButtonClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmMain.Load3PartsListboxItems();
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  ListBox3Parts.BeginUpdate;
  try
    ListBox3Parts.Clear;

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

      ListBox3Parts.AddObject(lLBItem);

      FDMemTable2.Next;
    end;
  finally
    ListBox3Parts.EndUpdate;
  end;
end;

procedure TfrmMain.ListBox3PartsItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmMain.LoadBottomListboxItems();
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  ListBoxBottom.BeginUpdate;
  try
    ListBoxBottom.Clear;

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

      ListBoxBottom.AddObject(lLBItem);

      FDMemTable3.Next;
    end;
  finally
    ListBoxBottom.EndUpdate;
  end;
end;

procedure TfrmMain.ListBoxBottomItemClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmMain.VertScrollBoxMainViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);

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

procedure TfrmMain.eSearchEnter(Sender: TObject);
begin
  eSearch.TextPrompt:= 'Search';

  FloatAnimationbtnMenu.Inverse:= False;
  FloatAnimationbtnMenu.Start;

  FloatAnimationbtnMic.Inverse:= False;
  FloatAnimationbtnMic.Start;
end;

procedure TfrmMain.eSearchExit(Sender: TObject);
begin
  FloatAnimationbtnMenu.Inverse:= True;
  FloatAnimationbtnMenu.Start;

  FloatAnimationbtnMic.Inverse:= True;
  FloatAnimationbtnMic.Start;
end;

end.

