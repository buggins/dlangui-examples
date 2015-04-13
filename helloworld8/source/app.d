import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    auto tlayout = new TableLayout();
    tlayout.colCount = 2;
    tlayout.margins = 20; // distance from window frame to vlayout background
    tlayout.padding = 10; // distance from vlayout background bound to child widgets
    tlayout.backgroundColor = 0xFFFFE0; // yellow background color

    tlayout.addChild(new TextWidget(null, "Label 1"d));
    auto edit1 = new EditLine(null, "Some text for parameter 1"d);
    tlayout.addChild(edit1);

    auto buttons = new HorizontalLayout();
    auto btn1 = new Button(null, "Ok"d);
    buttons.addChild(btn1);
    auto btn2 = new Button(null, "Cancel"d);
    buttons.addChild(btn2);
    tlayout.addChild(new TextWidget(null, ""d));
    tlayout.addChild(buttons);

    // define sample class which implements OnClickHandler interface
    class MyOnClickHandler : OnClickHandler {
        // override OnClickHandler.onClick
        override bool onClick(Widget source) {
            // show content of editor
            window.showMessageBox("Button btn1 pressed"d, "Editor content:"d ~ edit1.text);
            return true;
        }
    }
    // create instance of click handler class
    auto clickHandler = new MyOnClickHandler();
    // assign Ok button onClick handler: 
    btn1.onClickListener = clickHandler; // replace existing handlers with new one
    //btn1.onClickListener.connect(clickHandler); // add one more handler
    // if you want to disconnect existing handler you can use code like this:
    //btn1.onClickListener.disconnect(clickHandler); // remove handler

    // define some class with method having same arguments and result type as our signal
    class MyOnClickHandler2 {
        // method with proper signature, name may be arbitrary
        bool onCancelButtonClick(Widget source) {
            // close window
            window.close();
            return true;
        }
    }
    // create instance of click handler class
    auto cancelClickHandler = new MyOnClickHandler2();
    // assign Cancel button onClick handler (replacing existing handlers, if any)
    btn2.onClickListener = &cancelClickHandler.onCancelButtonClick;
    // append handler using connect method
    //btn2.onClickListener.connect(&cancelClickHandler.onCancelButtonClick);
    // remove handler using disconnect method
    //btn2.onClickListener.disconnect(&cancelClickHandler.onCancelButtonClick);

    // set window content widget
    window.mainWidget = tlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
