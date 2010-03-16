package xrope.demo.controller
{
    import xrope.demo.view.DemoView;
    /**
     * @author eidiot
     */
    public interface IXropeDemoController
    {
        function activate(view:DemoView):void;
        function deactivate():void;
    }
}