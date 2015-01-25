namespace SendMeAGribIOS;

interface

uses
  Sugar.*,
  SendMeAGrib,
  UIKit;

type
  [IBObject]
  FlipsideViewController = public class(UIViewController)
  private
  public

    method awakeFromNib; override;
    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;

    [IBAction]method done(aSender: id);
    [IBAction]method cancel(sender:id);
    [IBOutlet]property &delegate: weak IFlipsideViewControllerDelegate;
    
    [IBOutlet]property HostTextField:weak UITextField;
    [IBOutlet]property PortTextField:weak UITextField;
    [IBOutlet]property UsernameTextField:weak UITextField;
    [IBOutlet]property PasswordTextField:weak UITextField;
  end;

  IFlipsideViewControllerDelegate = public interface
    method flipsideViewControllerDidFinish(controller: FlipsideViewController);
    method UpdateSettings(newSettings:Settings);
  end;

implementation


method FlipsideViewController.awakeFromNib;
begin
  preferredContentSize := CGSizeMake(320.0, 480.0);
  inherited awakeFromNib;
end;

method FlipsideViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Do any additional setup after loading the view.
  
    var settings := new Settings;
    settings.restoreFromDefaults;
    
    self.HostTextField.text := settings.Host;
    self.PortTextField.text := settings.Port;
    self.UsernameTextField.text := settings.Username;
    self.PasswordTextField.text := settings.Password;
  
end;

method FlipsideViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

method FlipsideViewController.done(aSender: id);
begin

  if(String.IsNullOrEmpty(self.HostTextField.text))then
  begin
  end
  else if(String.IsNullOrEmpty(self.PortTextField.text))then
  begin
  end
  else if(String.IsNullOrEmpty(self.UsernameTextField.text))then
  begin
  end
  else if(String.IsNullOrEmpty(self.PasswordTextField.text))then
  begin
  end
  else
  begin

    var settings := new Settings;
    
    settings.Host := self.HostTextField.text;
    settings.Port := self.PortTextField.text;
    settings.Username := self.UsernameTextField.text;
    settings.Password := self.PasswordTextField.text;
    
    
    &delegate.UpdateSettings(settings);
    &delegate:flipsideViewControllerDidFinish(self);
  end;
end;

method FlipsideViewController.cancel(sender: id);
begin
  &delegate:flipsideViewControllerDidFinish(self);
end;

end.
