package main

import "core:fmt"

import "../core/data"
import "../core/security"
import "../core/engine"
import "../utils/errors"
import "../utils/logging"
import "../utils/misc"

main :: proc ()
{
  //Start the logging system
  logging.main()
  //Create the cluster id cache file and clusters directory
  data.main()

  security.main()

  //Print the Ostrich logo and version
  fmt.printfln(misc.ostrich_art)
	version:= transmute(string)misc.get_ost_version()
	fmt.printfln("%sVersion: %s%s%s", misc.BOLD,misc.GREEN,version, misc.RESET)
  
  
  
  switch(engine.ost_engine.Initialized)
  {
    case false:
      security.OST_INIT_USER_SETUP()
    break
    case true:
      // do stuff
  }

}