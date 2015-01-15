namespace SendMeAGrib;

interface

uses
  Foundation;

type

  Key = public class
  public
    property Name:String;
    property Description:String;
  end;

  Keys = public static class
  private
  protected
  public
    method SystemKeys:NSArray<Key>;
  end;

implementation

method Keys.SystemKeys: NSArray<Key>;
begin
  var validKeys := new NSMutableArray<Key>;
  
  validKeys.addObject(new Key ( Name := 'Pacific', Description := 'Pacific Region Forecast Data (includes Gulf of Alaska data)'));
  validKeys.addObject(new Key ( Name := 'Atlantic', Description := 'West Atlantic (US) Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Canada', Description := 'East Canada Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Caribbean', Description := 'Caribbean Sea and Gulf of Mexico'));
  validKeys.addObject(new Key ( Name := 'Drake', Description := 'Drake Passage in SSAmerica'));
  validKeys.addObject(new Key ( Name := 'EastAtlantic', Description := 'East Atlantic Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'GreatLakes', Description := 'Great Lakes Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'NorthEurope', Description := 'North Europe Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Argentina', Description := 'Chile, Argentina Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'SouthAfrica', Description := 'South Africa Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Brasil', Description := 'Brasil Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'NewZealand', Description := 'New Zealand Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Mediterranean', Description := 'Mediterranean Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Scandinavia', Description := 'Scandinavia Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Barents', Description := 'Barent Sea Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Baffin', Description := 'Baffin Bay Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'WAlaska', Description := 'West Alaska Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Vancouver', Description := 'Vancouver Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'CentralNPacific', Description := 'Central North Pacific Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'CentralSPacific', Description := 'Central South Pacific Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'SSPacific', Description := 'South Pacific Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'CentralPacific', Description := 'Central Pacific Region ForecastData')); 
  validKeys.addObject(new Key ( Name := 'ChilePeru', Description := 'Chile and Peru Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'CentralAmerica', Description := 'Central America Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'SSAtlantic', Description := 'South Atlantic Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Madagascar', Description := 'Madagascar Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Indian', Description := 'Indian Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'NIndian', Description := 'North Indian Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'WKergelen', Description := 'West Kergelen Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'Kergelen', Description := 'Kergelen Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'SAustralia', Description := 'South Australia Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'IndonesiaAustralia', Description := 'Indonesia and Australia Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'IndonesiaNewZealand', Description := 'Indonesia and New Zealand Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'China', Description := 'China Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'WPacific', Description := 'West Pacific Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'NJapan', Description := 'North Japan Region Forecast Data')); 
  validKeys.addObject(new Key ( Name := 'CentralAtlantic', Description := 'Central Atlantic Region Forecast Data')); 
  
  exit validKeys;
end;

end.
