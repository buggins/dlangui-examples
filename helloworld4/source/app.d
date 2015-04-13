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

    // HorizontalLayout inside of VerticalLayout

    auto hlayout1 = new HorizontalLayout();
    hlayout1.backgroundColor = 0xE0FFFF; // different background for horizontal layout

    // put some widgets into background
    hlayout1.addChild(new RadioButton(null, "RadioButton1"d));
    hlayout1.addChild(new RadioButton(null, "RadioButton2"d));
    hlayout1.addChild(new RadioButton(null, "RadioButton3"d));
    hlayout1.addChild(new RadioButton(null, "RadioButton4"d));

    vlayout.addChild(hlayout1);

    // create some widget to show in window
    window.mainWidget = vlayout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
