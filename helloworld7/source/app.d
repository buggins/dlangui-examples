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

    // assign Ok button onClick handler: show content of editor
    btn1.click = delegate(Widget src) {
        window.showMessageBox("Button btn1 pressed"d, "Editor content:"d ~ edit1.text);
        return true;
    };
    // assign Cancel button onClick handler
    btn2.click = delegate(Widget src) {
        window.close();
        return true;
    };

    // set window content widget
    window.mainWidget = tlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
