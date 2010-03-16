package xrope.demo.view
{
    import xrope.demo.controller.DemoControllerFactory;
    import xrope.demo.controller.IXropeDemoController;
    import xrope.demo.model.DemoModel;

    import flash.display.Shape;
    import flash.display.Sprite;
    /**
     * @author eidiot
     */
    public class DemoView extends Sprite
    {
        //======================================================================
        //  Dependencies
        //======================================================================
        [Inject]
        public var model:DemoModel;
        [Inject]
        public var controllerFactory:DemoControllerFactory;
        //======================================================================
        //  Variables
        //======================================================================
        private var controller:IXropeDemoController;
        //======================================================================
        //  Public methods
        //======================================================================
        [PostConstruct]
        public function initialize():void
        {
            for (var i:int = 0; i < 50; i++)
            {
                addChild(getShape(i == 25 ? 45 : -1));
            }
            activateController();
            model.groupChanged.add(onGroupChanged);
        }
        //======================================================================
        //  Private methods
        //======================================================================
        private function activateController():void
        {
            if (controller)
            {
                controller.deactivate();
            }
            controller = controllerFactory.create(model.group);
            controller.activate(this);
        }
        private function getShape(fixHeight:Number = -1):Shape
        {
            var s:Shape = new Shape();
            with (s.graphics)
            {
                beginFill(Math.random() * 0xFFFFFF);
                var x:Number = 15 - Math.random() * 30;
                var y:Number = 15 - Math.random() * 30;
                var width:Number = randomSize();
                var height:Number = fixHeight > 0 ? fixHeight : randomSize();
                drawRect(x, y, width, height);
                endFill();
            }
            return s;
        }
        private function randomSize():Number
        {
            return 15 + Math.random() * 15;
        }
        //======================================================================
        //  Callbacks
        //======================================================================
        private function onGroupChanged():void
        {
            activateController();
        }
    }
}