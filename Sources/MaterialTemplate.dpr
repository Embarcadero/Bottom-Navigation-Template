program MaterialTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'GUI\ufrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
