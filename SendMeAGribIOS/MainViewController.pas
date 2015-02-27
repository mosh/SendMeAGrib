namespace SendMeAGribIOS;

interface

uses
  Sugar,
  SendMeAGrib.*,
  UIKit;

type
  [IBObject]
  MainViewController = public class(UIViewController, 
    IUIPopoverControllerDelegate, IFlipsideViewControllerDelegate, IUIPickerViewDataSource, IUIPickerViewDelegate, IUITextFieldDelegate)
  private
    {$REGION IUIPopoverControllerDelegate}
    method popoverControllerShouldDismissPopover(aPopoverController: UIPopoverController): Boolean;
    method popoverControllerDidDismissPopover(aPopoverController: UIPopoverController);
    {$ENDREGION}
    {$REGION IFlipsideViewControllerDelegate}
    method flipsideViewControllerDidFinish(aController: FlipsideViewController);
    method UpdateSettings(newSettings:Settings);
    {$ENDREGION}
    
    method numberOfComponentsInPickerView(pickerView: UIPickerView): NSInteger;
    method pickerView(pickerView: UIPickerView) numberOfRowsInComponent(component: NSInteger): NSInteger;
    method pickerView(pickerView: UIPickerView) titleForRow(row: NSInteger) forComponent(component: NSInteger): NSString;
    
    method textField(textField: UITextField) shouldChangeCharactersInRange(range: NSRange) replacementString(string: NSString): BOOL;
    
    _keys : NSArray<Key>;
    _settings:Settings;
    _selectedAnimation : Animation;
    
    _calculateOutputValueBlock : block(note:NSNotification);
    
  public
    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;
    method prepareForSegue(aSegue: UIStoryboardSegue) sender(aSender: id); override;

    [IBAction]method togglePopover(aSender: id);
    [IBOutlet]property flipsidePopoverController: UIPopoverController;
    [IBAction]method sendMail(sender:id);
    [IBAction]method cancelRequest(sender:id);
    
    [IBOutlet]property KeysPickerView:weak UIPickerView;
    [IBOutlet]property StartTextField:weak UITextField;
    [IBOutlet]property IntervalTextField:weak UITextField;
    [IBOutlet]property ForecastTextField:weak UITextField;
    [IBOutlet]property TimesTextField:weak UITextField;
    [IBOutlet]property ForecastOutputLabel:weak UILabel;
    [IBOutlet]property UseAnimationSwitch:weak UISwitch;
    [IBOutlet]property UseAutomaticScheduleSwitch:weak UISwitch;
    [IBOutlet]property UseTimeOfForecastSwitch:weak UISwitch;
    [IBOutlet]property AnimationController:weak AnimationTableViewController;
    [IBOutlet]property IntervalStepper:weak UIStepper;
    [IBOutlet]property ForecastStepper:weak UIStepper;
    [IBOutlet]property SendResultLabel:weak UILabel;
    
    [IBAction]method stepperValueChanged(sender:UIStepper);
  end;

implementation

method MainViewController.viewDidLoad;
begin
  inherited viewDidLoad;
  

  // Do any additional setup after loading the view.
  _settings := new Settings;
  
  _settings.restoreFromDefaults;
  
  _keys := Keys.SystemKeys;
  self.KeysPickerView.dataSource := self;
  self.KeysPickerView.delegate := self;
    
  self.TimesTextField.delegate := self;
  self.StartTextField.delegate := self;
  self.IntervalTextField.delegate := self;
  self.ForecastTextField.delegate := self;
  
  self.ForecastOutputLabel.text := '';
  self.UseAnimationSwitch.on := false;
  self.UseAutomaticScheduleSwitch.on := false;
  self.UseTimeOfForecastSwitch.on := false;
  
  var startingValue := 6;
  
  self.TimesTextField.text := '1';
  self.ForecastStepper.value := startingValue;
  self.IntervalStepper.value := startingValue;
  self.StartTextField.text := startingValue.description;
  self.ForecastTextField.text := startingValue.description;
  self.IntervalTextField.text := startingValue.description;
  
  
  var defaultCenter := NSNotificationCenter.defaultCenter;
  
  _calculateOutputValueBlock := method(note:NSNotification); begin 
    
                              var value := '';
                              var integerValue:= self.StartTextField.text.integerValue;
                              var numberOfForecasts := self.ForecastTextField.text.integerValue;
                              var interval := self.IntervalTextField.text.integerValue;                        
                              
                              for  x:Integer := 0 to numberOfForecasts - 1 do
                              begin
                                
                                if(x > 0)then
                                begin
                                  integerValue := integerValue + interval;
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
                              
                              self.ForecastOutputLabel.text := value;
    

                             end;
  
  
  
  defaultCenter.addObserverForName(UITextFieldTextDidChangeNotification) object(StartTextField) queue(nil) usingBlock(_calculateOutputValueBlock); 
  defaultCenter.addObserverForName(UITextFieldTextDidChangeNotification) object(IntervalTextField) queue(nil) usingBlock(_calculateOutputValueBlock); 
  defaultCenter.addObserverForName(UITextFieldTextDidChangeNotification) object(ForecastTextField) queue(nil) usingBlock(_calculateOutputValueBlock); 
  
  _calculateOutputValueBlock(nil);
  
  SendResultLabel.text := '';
end;

method MainViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

{$REGION IUIPopoverControllerDelegate}
method MainViewController.popoverControllerShouldDismissPopover(aPopoverController: UIPopoverController):Boolean;
begin
end;

method MainViewController.popoverControllerDidDismissPopover(aPopoverController: UIPopoverController);
begin
  flipsidePopoverController := nil;
end;
{$ENDREGION}

{$REGION IFlipsideViewControllerDelegate}
method MainViewController.flipsideViewControllerDidFinish(aController: FlipsideViewController);
begin
  if UIDevice.currentDevice.userInterfaceIdiom = UIUserInterfaceIdiom.UIUserInterfaceIdiomPhone then begin
    dismissViewControllerAnimated(true) completion(nil);
  end
  else begin
    flipsidePopoverController.dismissPopoverAnimated(true);
    flipsidePopoverController := nil;
  end;
end;
{$ENDREGION}

method MainViewController.prepareForSegue(aSegue: UIStoryboardSegue) sender(aSender: id);
begin

  var identifier := aSegue.identifier;

  if ((assigned(identifier)) and (identifier.isEqualToString('showAlternate'))) then 
  begin

    aSegue.destinationViewController.delegate := self;
    if UIDevice.currentDevice.userInterfaceIdiom = UIUserInterfaceIdiom.UIUserInterfaceIdiomPad then 
    begin
      var lPopoverController := (aSegue as UIStoryboardPopoverSegue).popoverController;
      flipsidePopoverController := lPopoverController;
      lPopoverController.delegate := self;
    end;
  end
  else if ((assigned(identifier)) and (identifier.isEqualToString('showContainer')))then
  begin
    if((assigned(aSegue.destinationViewController)) and (aSegue.destinationViewController is AnimationTableViewController))then
    begin
      AnimationController := AnimationTableViewController(aSegue.destinationViewController);
      if(not assigned(AnimationController.SelectionChanged))then
      begin
        AnimationController.SelectionChanged := method (newSelection:Animation) 
          begin
            _selectedAnimation := newSelection;
          end;
      end;
    end;
  end;
  
end;

method MainViewController.cancelRequest(sender: id);
begin
end;

method MainViewController.sendMail(sender: id);
begin
  var builder := new GMNEmailBuilder;
  var selected := self.KeysPickerView.selectedRowInComponent(0);
  builder.Region := self._keys[selected].Name;

  if(self.UseAnimationSwitch.on)then
  begin
    builder.SelectedAnimation := _selectedAnimation;
    if(assigned(AnimationController))then
    begin
      builder.SelectedAnimation := AnimationController.CurrentSelection;
    end;
  end;
  
  if(self.UseAutomaticScheduleSwitch.on)then
  begin
    builder.Repeat := true;
    builder.RepeatTimes := Convert.ToInt32(self.TimesTextField.text);
  end;
  
  if(self.UseTimeOfForecastSwitch.on)then
  begin
    builder.Times := true;
    builder.TimesOfForecast := self.ForecastOutputLabel.text;
  end;
  
  SendResultLabel.text := '';
  
  var emailTo := builder.Build;
  
  var mailer := new Mailer(self._settings.Host) withPort(Convert.ToInt32(self._settings.Port)) withUsername(self._settings.Username) withPassword(self._settings.Password);
  
  mailer.SentBlock := method (sent:Boolean) begin
      dispatch_async(dispatch_get_main_queue(), method begin
          if(sent)then
          begin
            SendResultLabel.text := 'Sent email to Global Marine Networks...';
          end
          else
          begin
            SendResultLabel.text := 'Failed to send email...';
          end;
        end);
    end;
  
  mailer.Send(emailTo);
  
  NSLog('%@',emailTo.Subject);
   
end;

method MainViewController.togglePopover(aSender: id);
begin
  if assigned(flipsidePopoverController) then 
  begin
    flipsidePopoverController.dismissPopoverAnimated(true);
    flipsidePopoverController := nil;
  end
  else 
  begin
    performSegueWithIdentifier('showAlternate') sender(aSender);
  end;
end;

method MainViewController.numberOfComponentsInPickerView(pickerView: UIPickerView): NSInteger;
begin
  exit 1;
end;

method MainViewController.pickerView(pickerView: UIPickerView) numberOfRowsInComponent(component: NSInteger): NSInteger;
begin
  exit _keys.count;
end;

method MainViewController.pickerView(pickerView: UIPickerView) titleForRow(row: NSInteger) forComponent(component: NSInteger): NSString;
begin
  exit _keys[row].Description;
end;

method MainViewController.textField(textField: UITextField) shouldChangeCharactersInRange(range: NSRange) replacementString(string: NSString): BOOL;
begin

  if(textField = TimesTextField)then
  begin
    var formatter := new IntegerFieldFormatter withMaximum(10) andMinimum(1);
    var someNumber := formatter.numberFromString(string);
    exit iif(assigned(someNumber), true, false);
  end
  else
  begin
    var formatter := new IntegerFieldFormatter withMaximumLength(5);
    var someNumber := formatter.numberFromString(string);
    exit iif(assigned(someNumber), true, false);
  end;
end;

method MainViewController.UpdateSettings(newSettings: Settings);
begin
  _settings.Host := newSettings.Host;
  _settings.Port := newSettings.Port;
  _settings.Username := newSettings.Username;
  _settings.Password := newSettings.Password;
  
  _settings.saveToDefaults;
end;

method MainViewController.stepperValueChanged(sender:UIStepper);
begin
  if(sender = IntervalStepper)then
  begin
    self.IntervalTextField.text := Integer(self.IntervalStepper.value).description;
  end
  else if(sender = ForecastStepper)then
  begin
    self.ForecastTextField.text := Integer(self.ForecastStepper.value).description;
  end;
  _calculateOutputValueBlock(nil);
end;


end.
