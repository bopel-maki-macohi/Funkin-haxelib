

class ChartEditorAboutDialog extends ChartEditorBaseDialog
{
public function new(chartEditorState2:ChartEditorState, params2:DialogParams)
{
}

public static function build(chartEditorState:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorAboutDialog
{
closable: closable ?? true,
modal: modal ?? true


}
}
