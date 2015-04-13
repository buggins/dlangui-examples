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
    tlayout.addChild(new EditLine(null, "Some text for parameter 1"d));
    tlayout.addChild(new TextWidget(null, "Label 2"d));
    tlayout.addChild(new EditLine(null, "Some text for parameter 2"d));
    tlayout.addChild(new TextWidget(null, "Label 3"d));
    tlayout.addChild(new ComboBox(null, ["item value 1"d, "item value 2"d, "item value 3"d, "item value 4"d, "item value 5"d, "item value 6"d]));

    auto buttons = new HorizontalLayout();
    buttons.addChild(new Button(null, "Ok"d));
    buttons.addChild(new Button(null, "Cancel"d));
    tlayout.addChild(new TextWidget(null, "Some buttons"d));
    tlayout.addChild(buttons);

    // create some widget to show in window
    window.mainWidget = tlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
