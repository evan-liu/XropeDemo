package xrope.demo.controller
{
    import xrope.GridLayout;
    import xrope.IMultiLineLayout;
    /**
     * @author eidiot
     */
    public class GridController extends AbstractDemoController
    {
        override protected function createGroup(w:Number, h:Number):IMultiLineLayout
        {
            return new GridLayout(view, w, h, 40, 50, 10, 10, model.subAlign, model.topAlign);
        }
        override protected function onSubAlignChanged():void
        {
            GridLayout(group).tileAlign = model.subAlign;
        }
        override protected function drawLines():void
        {
        }
    }
}