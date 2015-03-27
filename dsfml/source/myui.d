module myui;

import dlangui;

/// create some DlangUI widgets
Widget createMainWidget() {
    Widget res = new VerticalLayout();

	TableLayout table = new TableLayout("TABLE");
	table.colCount = 2;
	// headers
	table.addChild((new TextWidget(null, "Parameter Name"d)).alignment(Align.Right | Align.VCenter));
	table.addChild((new TextWidget(null, "Edit Box to edit parameter"d)).alignment(Align.Left | Align.VCenter));
	// row 1
	table.addChild((new TextWidget(null, "Parameter 1 name"d)).alignment(Align.Right | Align.VCenter));
	table.addChild((new EditLine("edit1", "Text 1"d)).layoutWidth(FILL_PARENT));
	// row 2
	table.addChild((new TextWidget(null, "Parameter 2 name bla bla"d)).alignment(Align.Right | Align.VCenter));
	table.addChild((new EditLine("edit2", "Some text for parameter 2"d)).layoutWidth(FILL_PARENT));
	// row 3
	table.addChild((new TextWidget(null, "Param 3 is disabled"d)).alignment(Align.Right | Align.VCenter).enabled(false));
	table.addChild((new EditLine("edit3", "Parameter 3 value"d)).layoutWidth(FILL_PARENT).enabled(false));
    // normal readonly combo box
    ComboBox combo1 = new ComboBox("combo1", ["item value 1"d, "item value 2"d, "item value 3"d, "item value 4"d, "item value 5"d, "item value 6"d]);
	table.addChild((new TextWidget(null, "Combo box param"d)).alignment(Align.Right | Align.VCenter));
    combo1.selectedItemIndex = 3;
	table.addChild(combo1).layoutWidth(FILL_PARENT);
    // disabled readonly combo box
    ComboBox combo2 = new ComboBox("combo2", ["item value 1"d, "item value 2"d, "item value 3"d]);
	table.addChild((new TextWidget(null, "Disabled combo box"d)).alignment(Align.Right | Align.VCenter));
    combo2.enabled = false;
    combo2.selectedItemIndex = 0;
	table.addChild(combo2).layoutWidth(FILL_PARENT);
	table.margins(Rect(10,10,10,10)).padding(Rect(10,10,10,10)).layoutWidth(FILL_PARENT).backgroundColor(0xC0808080);

    res.addChild(table);
    return res;
}
