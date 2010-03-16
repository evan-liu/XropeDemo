package xrope.demo.controller
{
    import xrope.HMultiLineLayout;
    import xrope.IMultiLineLayout;
    /**
     * @author eidiot
     */
    public class MultiLineController extends AbstractDemoController
    {
        override protected function createGroup(w:Number, h:Number):IMultiLineLayout
        {
            return new HMultiLineLayout(view, w, h, 50, 10, 10, model.topAlign);
        }
    }
}