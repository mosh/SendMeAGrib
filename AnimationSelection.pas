namespace SendMeAGrib;

interface

uses
  Foundation;

type

  AnimationSelection = public class
  private
  protected
  public
    property Description:String;
    property Value:Animation;
  end;
  
  OneDay = public class(AnimationSelection)
  public
    constructor;
  end;
  
  TwoDay = public class(AnimationSelection)
  public
    constructor;
  end;
  
  ThreeDay = public class(AnimationSelection)
  public
    constructor;
  end;
  
  FourDay = public class(AnimationSelection)
  public
    constructor;
  end;
  
  FiveDay = public class(AnimationSelection)
  public
    constructor;
  end;
  

implementation

constructor OneDay;
begin
  inherited;
  self.Description := 'One Day';
  self.Value := Animation.OneDay;
end;

constructor TwoDay;
begin
  inherited;
  self.Description := 'Two Day';
  self.Value := Animation.TwoDay;
end;

constructor ThreeDay;
begin
  inherited;
  self.Description := 'Three Day';
  self.Value := Animation.ThreeDay;
end;

constructor FourDay;
begin
  inherited;
  self.Description := 'Four Day';
  self.Value := Animation.FourDay;
end;

constructor FiveDay;
begin
  inherited;
  self.Description := 'Five Day';
  self.Value := Animation.FiveDay;
end;

end.
