import dlangui;

mixin APP_ENTRY_POINT;

class ControlsExampleWidget : VerticalLayout {

    ComboBox cb1;
    EditLine edit1;
    LogWidget logWidget;

    void logLine(dstring s) {
        logWidget.appendText(s ~ "\n"d);
    }

    this() {
        parseML(q{
            {
                padding: 5px; layoutWidth: FILL; layoutHeight: FILL
                VerticalLayout {
                    padding: 10px; layoutWidth: FILL; layoutHeight: FILL; backgroundColor: 0xFFFFC0
                    TextWidget { text: "Combo box example" }
                    ComboBox { id: cb1 }
                    TextWidget { text: "EditLine example" }
                    EditLine { id: edit1; text: "Some text to edit" }
                    TextWidget { text: "Buttons" }
                    HorizontalLayout {
                        Button { id: btn1; text: "Button 1" }
                        Button { id: btn2; text: "Button 2" }
                    }
                }
                LogWidget { id: logWidget; layoutWidth: FILL; layoutHeight: 130px }
            }
        }, "", this);
        // get ComboBox widget by id
        cb1 = childById!ComboBox("cb1");
        edit1 = childById!EditLine("edit1");
        logWidget = childById!LogWidget("logWidget");
        // assign items for widget
        cb1.items = ["Item 1 text"d, "Item 2 text"d, "Item 3 text"d];
        cb1.focusChange = delegate(Widget src, bool focused) {
            logLine(focused ? "cb1 is focused"d : "cb1 lost focus"d);
            return true;
        };
        cb1.itemClick = delegate(Widget src, int itemIndex) {
            logLine("cb1 item with index "d ~ to!dstring(itemIndex) ~ " is selected"d);
            return true;
        };
        edit1.contentChange = delegate(EditableContent content) {
            logLine("edit1 text changed: "d ~ content.text);
        };
        auto clickListener = delegate(Widget src) {
            logLine("Button "d ~ to!dstring(src.id) ~ " is clicked"d);
            switch(src.id) {
                case "btn1": logLine("case btn1:"); break;
                case "btn2": logLine("case btn1:"); break;
                default: logLine("default: other button pressed"); break;
            }
            return true;
        };
        childById("btn1").click = clickListener;
        childById("btn2").click = clickListener;
    }
}

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // create window
    Window window = Platform.instance.createWindow("DlangUI example - HelloWorld", null);

    // create some widget to show in window
    window.mainWidget = new ControlsExampleWidget();

    // show window
    window.show();

    // run message loop
    return Platform.instance.enterMessageLoop();
}
