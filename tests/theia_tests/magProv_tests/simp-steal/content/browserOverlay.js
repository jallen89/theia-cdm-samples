/**
 * XULSchoolChrome namespace.
 */
if ("undefined" == typeof(XULSchoolChrome)) {
  var XULSchoolChrome = {};
};

/**
 * Controls the browser overlay for the Hello World extension.
 */
XULSchoolChrome.BrowserOverlay = {
  /**
   * Says 'Hello' to the user.
   */
  sayHello : function(aEvent) {
    //read from file
    var file_rd = Components.classes["@mozilla.org/file/local;1"].
      createInstance(Components.interfaces.nsILocalFile);
    file_rd.initWithPath("/home/yang/tests/temp/test1.file");
    if ( file_rd.exists() == false ) {
      window.alert("File does not exist");
      return;
    }
    var istream = Components.classes["@mozilla.org/network/file-input-stream;1"]
    .createInstance(Components.interfaces.nsIFileInputStream);
    istream.init(file_rd, 0x01, 4, null);
    var fileScriptableIO = Components.classes["@mozilla.org/scriptableinputstream;1"].
      createInstance(Components.interfaces.nsIScriptableInputStream); 
    fileScriptableIO.init(istream);
    // parse the xml into our internal document
    istream.QueryInterface(Components.interfaces.nsILineInputStream); 
    var fileContent = "";
    var csize = 0; 
    while ((csize = fileScriptableIO.available()) != 0)
    {
      fileContent += fileScriptableIO.read( csize );
    }
    window.alert(fileContent);
    fileScriptableIO.close();   
    istream.close();

    //write to file
    var file_wr = Components.classes["@mozilla.org/file/local;1"].
      createInstance(Components.interfaces.nsILocalFile);
    file_wr.initWithPath("/home/yang/tests/temp/test2.file");
    var fs = Components.classes["@mozilla.org/network/file-output-stream;1"].
      createInstance(Components.interfaces.nsIFileOutputStream);
    fs.init(file_wr, 0x02 | 0x08 | 0x20, 0664, 0); // write, create, truncate
    fs.write(fileContent, fileContent.length);
    fs.close();

//    let stringBundle = document.getElementById("xulschoolhello-string-bundle");
//    let message = stringBundle.getString("xulschoolhello.greeting.label");
//
//    window.alert(message);
  }
};
