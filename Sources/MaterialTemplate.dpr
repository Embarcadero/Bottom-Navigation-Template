program MaterialTemplate;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'GUI\ufrmMain.pas' {frmMain},
  ufrmBasic in 'GUI\ufrmBasic.pas' {frmBasic},
  ufrmShifting in 'GUI\ufrmShifting.pas' {frmShifting},
  ufrmLight in 'GUI\ufrmLight.pas' {frmLight},
  ufrmDark in 'GUI\ufrmDark.pas' {frmDark},
  ufrmIcon in 'GUI\ufrmIcon.pas' {frmIcon},
  ufrmPrimary in 'GUI\ufrmPrimary.pas' {frmPrimary};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
