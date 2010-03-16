package xrope.demo
{
    import xrope.demo.controller.BoxController;
    import xrope.demo.controller.DemoControllerFactory;
    import xrope.demo.controller.GridController;
    import xrope.demo.controller.MultiLineController;
    import xrope.demo.model.DemoModel;
    import xrope.demo.view.DemoView;
    import xrope.demo.view.UIView;

    import org.robotlegs.mvcs.Context;

    import flash.display.DisplayObjectContainer;
    /**
     * @author eidiot
     */
    public class XropeDemoContext extends Context
    {
        //======================================================================
        //  Constructor
        //======================================================================
        public function XropeDemoContext(contextView:DisplayObjectContainer)
        {
            super(contextView);
        }
        //======================================================================
        //  Protected methods
        //======================================================================
        override public function startup():void
        {
            //-- Signals
            _injector.mapSingleton(DemoModel);
            //-- Controller
            _injector.mapSingleton(DemoControllerFactory);
            _injector.mapSingleton(BoxController);
            _injector.mapSingleton(MultiLineController);
            _injector.mapSingleton(GridController);
            //-- Map View
            _viewMap.mapType(UIView);
            _viewMap.mapType(DemoView);
            //-- Add View
            var ui:UIView = new UIView();
            _contextView.addChild(ui);
            var demo:DemoView = new DemoView();
            demo.y = ui.height + 10;
            _contextView.addChild(demo);
        }
    }
}