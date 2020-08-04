package Logging is

  type Level is (Info, Debug, Warning, Error);

  procedure Log (App_Name : in String;
  Msg_Level : in Level; Msg : in String);

end Logging;
