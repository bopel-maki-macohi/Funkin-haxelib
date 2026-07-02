package funkin.ui.debug.charting.dialogs;


class ChartEditorAboutDialog extends ChartEditorBaseDialog
{
public function new(chartEditorState2:ChartEditorState, params2:DialogParams)
{
super(chartEditorState2, params2);
}

public static function build(chartEditorState:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorAboutDialog
{
closable: closable ?? true,
modal: modal ?? true
});

dialog.showDialog(modal ?? true);

}
}
