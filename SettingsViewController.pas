namespace SendMeAGrib;

interface

uses
  AppKit;

type
  [IBObject]
  SettingsViewController = public class(NSViewController,IPoppedUpViewController)
  private
    method willShow(newSettings:Settings);
    
  protected
  public
    method init: instancetype; override;
    [IBAction] method doCancel(sender:id);
    [IBAction] method doOk(sender:id);
    property ParentController:IParentController;
    property Settings:Settings read private write;
  end;

implementation

method SettingsViewController.init: instancetype;
begin
  self := inherited initWithNibName('SettingsViewController') bundle(nil);
  if assigned(self) then 
  begin
    // Custom initialization
    self.Settings := new Settings;
  end;
  result := self;
end;

method SettingsViewController.doCancel(sender: id);
begin
  self.ParentController.CancelAction;
end;

method SettingsViewController.doOk(sender: id);
begin
  self.ParentController.OkAction;
end;

method SettingsViewController.willShow(newSettings:Settings);
begin
  self.Settings.Host := newSettings.Host;
  self.Settings.Port := newSettings.Port;
  self.Settings.Username := newSettings.Username;
  self.Settings.Password := newSettings.Password;
end;


end.
