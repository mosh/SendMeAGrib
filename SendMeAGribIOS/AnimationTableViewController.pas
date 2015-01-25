namespace SendMeAGribIOS;

interface

uses
  SendMeAGrib,
  UIKit;

type
  [IBObject]
  AnimationTableViewController = public class(UITableViewController)
  private
  protected
  
    {$REGION Table view data source}
    method tableView(tableView: UITableView) cellForRowAtIndexPath(indexPath: NSIndexPath): UITableViewCell;
    {$ENDREGION}
  
    

    {$REGION Table view delegate}
    method tableView(tableView: UITableView) didSelectRowAtIndexPath(indexPath: NSIndexPath);
    {$ENDREGION}
    
    property selectedRow:Integer;
    method get_CurrentSelection:Animation;

  public
    method init: instancetype; override;
    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;
    
    property SelectionChanged:block(newSelection:Animation);
    property CurrentSelection:Animation read get_CurrentSelection;
  end;
  
  

implementation

method AnimationTableViewController.init: instancetype;
begin
  self := inherited initWithStyle(UITableViewStyle.UITableViewStylePlain);
  if assigned(self) then 
  begin

    // Custom initialization

  end;
  result := self;
end;

method AnimationTableViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Uncomment the following line to preserve selection between presentations.
  // clearsSelectionOnViewWillAppear := false;

  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // navigationItem.rightBarButtonItem := editButtonItem;

  // Do any additional setup after loading the view.
end;

method AnimationTableViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

method AnimationTableViewController.get_CurrentSelection:Animation;
begin
  exit Animation(selectedRow+1);
end;

{$REGION  Table view delegate}

method AnimationTableViewController.tableView(tableView: UITableView) didSelectRowAtIndexPath(indexPath: NSIndexPath);
begin
  selectedRow := indexPath.row;
  
  
  if(assigned(SelectionChanged))then
  begin
    SelectionChanged(Animation(selectedRow+1));
  end;
  
  self.tableView.reloadData;
end;

{$ENDREGION}

{$REGION Table view data source}

method AnimationTableViewController.tableView(tableView: UITableView) cellForRowAtIndexPath(indexPath: NSIndexPath): UITableViewCell;
begin
  var cell := inherited.tableView(tableView) cellForRowAtIndexPath(indexPath);
  cell.accessoryType := UITableViewCellAccessoryType.UITableViewCellAccessoryNone;
    
  if(selectedRow = indexPath.row)then
  begin
    cell.accessoryType := UITableViewCellAccessoryType.UITableViewCellAccessoryCheckmark;
  end;
  exit cell;
end;

{$ENDREGION}


end.
