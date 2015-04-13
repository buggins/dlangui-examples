import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    auto vlayout = new VerticalLayout();
    vlayout.margins = 20; // distance from window frame to vlayout background
    vlayout.padding = 10; // distance from vlayout background bound to child widgets
    vlayout.backgroundColor = 0xFFFFC0; // yellow background color

    // put some widgets into background
    vlayout.addChild(new TextWidget(null, "First text item"d));
    vlayout.addChild(new TextWidget(null, "Second text item"d));
    vlayout.addChild(new TextWidget(null, "Third text item"d));
    vlayout.addChild(new CheckBox(null, "Check box text"d));
    vlayout.addChild(new ImageTextButton(null, "dialog-ok", "Check box text"d));

    // create some widget to show in window
    window.mainWidget = vlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
