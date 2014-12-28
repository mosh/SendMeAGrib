namespace MailCoreCocoaApplication;

interface

uses
  AppKit,
  RemObjects.Elements.Linq,
  Foundation,Sugar;

type
  [IBObject]
  MainWindowController = public class(NSWindowController,IParentController)
  private
      method CancelAction;
      method OkAction;
      _settings:Settings;
      method bindPopup(popupButton:NSPopUpButton;arrayController:NSArrayController;displayField:String);
      
  protected
  public
    method init: instancetype; override;
    method windowDidLoad; override;
    [IBOutlet]property sendButton:weak NSButton;
    [IBOutlet]property settingsPopover:weak NSPopover;
    [IBOutlet]property KeysArrayController:weak NSArrayController;
    [IBOutlet]property settingsButton:weak NSButton;
    [IBOutlet]property animationButton:weak NSButton;
    [IBOutlet]property automaticScheduleButton:weak NSButton;
    [IBOutlet]property timesButton:weak NSButton;
    [IBOutlet]property numberOfDays:weak NSMatrix;
    [IBOutlet]property timesTextField:weak NSTextField;
    [IBOutlet]property KeyPopupButton:weak NSPopUpButton;
    
    [IBAction]method doSettings(sender:id);
    [IBAction]method sendMail(sender:id);
    [IBAction]method cancelRequest(sender:id);
    
  end;

implementation

method MainWindowController.init: instancetype;
begin
  self := inherited initWithWindowNibName('MainWindowController');
  if assigned(self) then 
  begin
    // Custom initialization
    self._settings := new Settings;
  end;
  result := self;
end;

method MainWindowController.windowDidLoad;
begin
  inherited windowDidLoad();

  var defaults := NSUserDefaults.standardUserDefaults;
  
  var value := defaults.stringForKey('Host');
  if(not String.IsNullOrEmpty(value))then
  begin
    _settings.Host := value;
  end;
  
  value := defaults.stringForKey('Port');
  if(not String.IsNullOrEmpty(value))then
  begin
    _settings.Port := value;
  end;
  value := defaults.stringForKey('Username');
  if(not String.IsNullOrEmpty(value))then
  begin
    _settings.Username := value;
  end;
  
  value := defaults.stringForKey('Password');
  if(not String.IsNullOrEmpty(value))then
  begin
    _settings.Password := value;
  end;
    
  self.KeysArrayController.content := Keys.SystemKeys;
  
  bindPopup(KeyPopupButton, KeysArrayController,'Description');
  
  self.settingsPopover.contentViewController := new SettingsViewController;
  (self.settingsPopover.contentViewController as SettingsViewController).ParentController := self;
  

  if(
    (String.IsNullOrEmpty(_settings.Host)) or
    (String.IsNullOrEmpty(_settings.Port)) or
    (String.IsNullOrEmpty(_settings.Username)) or
    (String.IsNullOrEmpty(_settings.Password)))then
  begin
    doSettings(self);
  end;
  
end;

method MainWindowController.sendMail(sender: id);
begin
  var builder := new GMNEmailBuilder;
  
  var selected := self.KeysArrayController.selectedObjects.firstOrDefault;
  
  if(assigned(selected))then
  begin
    var someKey := selected as Key;
    var emailTo := builder.Build(someKey.Name);
    
    var mailer := new Mailer(self._settings.Host) withPort(465) withUsername(self._settings.Username) withPassword(self._settings.Password);
    mailer.Send(emailTo);
  end;
    
end;

method MainWindowController.doSettings(sender: id);
begin
   self.settingsPopover.showRelativeToRect(self.settingsButton.bounds) ofView(self.settingsButton) preferredEdge(NSMaxYEdge);
end;

method MainWindowController.CancelAction;
begin
  self.settingsPopover.close;
end;

method MainWindowController.OkAction;
begin
  var viewController := (self.settingsPopover.contentViewController as SettingsViewController);
  
  self._settings.Host := viewController.Settings.Host;
  self._settings.Port := viewController.Settings.Port;
  self._settings.Username := viewController.Settings.Username;
  self._settings.Password := viewController.Settings.Password;
  
  var defaults := NSUserDefaults.standardUserDefaults;
  
  defaults.setObject(viewController.Settings.Host) forKey('Host');
  defaults.setObject(viewController.Settings.Port) forKey('Port');
  defaults.setObject(viewController.Settings.Username) forKey('Username');
  defaults.setObject(viewController.Settings.Password) forKey('Password');
  defaults.synchronize;
  
  self.settingsPopover.close;
end;

method MainWindowController.cancelRequest(sender: id);
begin
  self.settingsPopover.close;
end;

method MainWindowController.bindPopup(popupButton:NSPopUpButton;arrayController:NSArrayController;displayField:String);
begin
  var options := new NSDictionary;
  popupButton.bind('content') toObject(arrayController ) withKeyPath('arrangedObjects') options(options);
  var keyPath := 'arrangedObjects.'+displayField;
  popupButton.bind('contentValues') toObject(arrayController ) withKeyPath(keyPath) options(options);
  popupButton.bind('selectedIndex') toObject(arrayController ) withKeyPath('selectionIndex') options(options);
end;

end.
