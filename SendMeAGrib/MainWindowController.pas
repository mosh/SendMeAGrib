namespace SendMeAGrib;

interface

uses
  AppKit,
  RemObjects.Elements.Linq,
  Foundation,Sugar;

type

  [IBObject]
  MainWindowController = public class(NSWindowController,IParentController,INSPopoverDelegate)
  private
      method CancelAction;
      method OkAction;
      _settings:Settings;
      method bindPopup(popupButton:NSPopUpButton;arrayController:NSArrayController;displayField:String);
      method bindMatrix(matrix:NSMatrix;arrayController:NSArrayController;displayField:String);
      method bindTextField(textfield:NSTextField; object:NSObject;  keyPath:String);

      method popoverWillShow(notification: Foundation.NSNotification);
      _animationSelections:NSMutableArray<AnimationSelection>;
      
      method BuildOutputValue:String;
      
  protected
  public
    method init: instancetype; override;
    method windowDidLoad; override;
    
    [IBOutlet]property sendButton:weak NSButton;
    [IBOutlet]property settingsPopover:weak NSPopover;
    [IBOutlet]property KeysArrayController:weak NSArrayController;
    [IBOutlet]property AnimationSelectionsArrayController:weak NSArrayController;
    [IBOutlet]property settingsButton:weak NSButton;
    [IBOutlet]property animationButton:weak NSButton;
    [IBOutlet]property automaticScheduleButton:weak NSButton;
    [IBOutlet]property timesButton:weak NSButton;
    [IBOutlet]property numberOfDays:weak NSMatrix;
    [IBOutlet]property timesTextField:weak NSTextField;
    [IBOutlet]property KeyPopupButton:weak NSPopUpButton;
    [IBOutlet]property outputValueTextField:weak NSTextField;
    
    [IBAction]method doSettings(sender:id);
    [IBAction]method sendMail(sender:id);
    [IBAction]method cancelRequest(sender:id);
    [IBAction]method transformOutputValue(sender:id);

    property UseAnimation:Boolean;
    property UseAutomaticSchedule:Boolean;
    property UseTimeOfForecast:Boolean;
    
    property RepeatTimes:Integer;
    
    property Interval:Integer;
    property Start:Integer;
    property OutputValue:String;
    property NumberOfForecasts:Integer;
  end;

implementation

method MainWindowController.init: instancetype;
begin
  self := inherited initWithWindowNibName('MainWindowController');
  if assigned(self) then 
  begin
  
    self.Interval := 6;
    self.Start := 6;
    self.NumberOfForecasts := 6;
    
    self._settings := new Settings;
    _animationSelections := new NSMutableArray<AnimationSelection>;
    _animationSelections.addObject(new OneDay);
    _animationSelections.addObject(new TwoDay);
    _animationSelections.addObject(new ThreeDay);
    _animationSelections.addObject(new FourDay);
    _animationSelections.addObject(new FiveDay);
  end;
  result := self;
end;

method MainWindowController.windowDidLoad;
begin
  inherited windowDidLoad();
  
  transformOutputValue(self);
  
  var formatter := new IntegerFieldFormatter withMaximumLength(5);
  timesTextField.formatter := formatter;

  _settings.restoreFromDefaults;
    
  self.KeysArrayController.content := Keys.SystemKeys;
  self.AnimationSelectionsArrayController.content:= self._animationSelections;
  
  bindPopup(KeyPopupButton, KeysArrayController, 'self.Description');
  bindMatrix(numberOfDays, AnimationSelectionsArrayController, 'self.Description');
  bindTextField(self.outputValueTextField,self,'self.OutputValue');
  
  
  self.settingsPopover.contentViewController := new SettingsViewController;
  self.settingsPopover.&delegate := self;
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
    builder.Region := someKey.Name;
    
    if(self.UseAnimation)then
    begin
      var selectedSelection := self.AnimationSelectionsArrayController.selectedObjects.firstOrDefault;
      if(assigned(selectedSelection))then
      begin
        var selectedAnimation := selectedSelection as AnimationSelection;
        builder.SelectedAnimation := selectedAnimation.Value;
      end;
    end;
    
    if(self.UseAutomaticSchedule)then
    begin
      builder.Repeat := true;
      builder.RepeatTimes := self.RepeatTimes;
    end;
    
    if(self.UseTimeOfForecast)then
    begin
      builder.Times := true;
      builder.TimesOfForecast := self.OutputValue;
    end;
    
    var emailTo := builder.Build;
    var mailer := new Mailer(self._settings.Host) withPort(465) withUsername(self._settings.Username) withPassword(self._settings.Password);
    mailer.Send(emailTo);
    
    NSLog('@%',emailTo.Subject);
    
  end;
    
end;

method MainWindowController.transformOutputValue(sender: id); 
begin
  var newValue := BuildOutputValue;
  self.setValue(newValue) forKeyPath('self.OutputValue');
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
  
  _settings.saveToDefaults;
  
  self.settingsPopover.close;
end;

method MainWindowController.cancelRequest(sender: id);
begin
  self.settingsPopover.close;
end;

method MainWindowController.bindTextField(textfield:NSTextField; object:NSObject;  keyPath:String);
begin
  textfield.bind('value') toObject(object) withKeyPath(keyPath) options(nil);
  //object.addObserver(textfield) forKeyPath(keyPath) options(0) context(nil);
  
end;

method MainWindowController.bindPopup(popupButton:NSPopUpButton;arrayController:NSArrayController;displayField:String);
begin
  var options := new NSDictionary;
  popupButton.bind('content') toObject(arrayController ) withKeyPath('arrangedObjects') options(options);
  var keyPath := 'arrangedObjects.'+displayField;
  popupButton.bind('contentValues') toObject(arrayController ) withKeyPath(keyPath) options(options);
  popupButton.bind('selectedIndex') toObject(arrayController ) withKeyPath('selectionIndex') options(options);
end;

method MainWindowController.bindMatrix(matrix:NSMatrix;arrayController:NSArrayController;displayField:String);
begin
  var options := new NSDictionary;
  matrix.bind('content') toObject(arrayController ) withKeyPath('arrangedObjects') options(options);
  var keyPath := 'arrangedObjects.'+displayField;
  matrix.bind('contentValues') toObject(arrayController ) withKeyPath(keyPath) options(options);
  matrix.bind('selectedIndex') toObject(arrayController ) withKeyPath('selectionIndex') options(options);
end;

method MainWindowController.popoverWillShow(notification: Foundation.NSNotification);
begin
  if(notification.object is NSPopover)then
  begin
    var notifyingPopover := notification.object as NSPopover;
    if(notifyingPopover.contentViewController is IPoppedUpViewController)then
    begin
      (notifyingPopover.contentViewController as IPoppedUpViewController).willShow(_settings);
    end
    else
    begin
      NSLog('Didnt support IPoppedUpViewController');
    end;
  
  end;

end;

method MainWindowController.BuildOutputValue: String;
begin
  var value := '';
  var integerValue:= Start;
  
  for  x:Integer := 0 to NumberOfForecasts - 1 do
  begin
    
    if(x > 0)then
    begin
      integerValue := integerValue + Interval;
    end;
    if(value.length=0)then
    begin
      value := NSString.stringWithFormat('%d',integerValue);
    end
    else
    begin
      value := NSString.stringWithFormat('%@ %d',value,integerValue);
    end;
    
  end;
  
  exit value;
end;


end.
