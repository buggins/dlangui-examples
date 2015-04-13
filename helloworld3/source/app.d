import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    auto hlayout = new HorizontalLayout();
    hlayout.margins = 20; // distance from window frame to vlayout background
    hlayout.padding = 10; // distance from vlayout background bound to child widgets
    hlayout.backgroundColor = 0xFFFFC0; // yellow background color

    // put some widgets into background
    hlayout.addChild(new TextWidget(null, "First text item"d));
    hlayout.addChild(new TextWidget(null, "Second text item"d));
    hlayout.addChild(new TextWidget(null, "Third text item"d));
    hlayout.addChild(new CheckBox(null, "Check box text"d));
    hlayout.addChild(new ImageTextButton(null, "dialog-ok", "Check box text"d));

    // create some widget to show in window
    window.mainWidget = hlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
