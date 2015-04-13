import dlangui;

mixin APP_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    // create layout from DML
    auto layout = parseML(q{
        TableLayout {
            colCount: 2
            margins: 20; padding: 10
            backgroundColor: "#FFFFE0"
            TextWidget { text: "Label 1" }
            EditLine { text: "Some text for parameter 1" }
            TextWidget { text: "Label 2" }
            EditLine { text: "Some text for parameter 2" }
            TextWidget { text: "Label 3" }
            ComboBox { }
            TextWidget { text: "Some buttons" }
            HorizontalLayout {
                Button { text: "Ok" }
                Button { text: "Cancel" }
            }
        }
    });

    // set window content widget
    window.mainWidget = layout;

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
