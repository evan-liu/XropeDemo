package xrope.demo.controller
{
    import xrope.HBoxLayout;
    import xrope.ILayoutElement;
    import xrope.IMultiLineLayout;
    import xrope.demo.model.DemoModel;
    import xrope.demo.utils.drawRim;
    import xrope.demo.view.DemoView;
    /**
     * @author eidiot
     */
    public class AbstractDemoController implements IXropeDemoController
    {
        //======================================================================
        //  Dependencies
        //======================================================================
        [Inject]
        public var model:DemoModel;
        //======================================================================
        //  Variables
        //======================================================================
        protected var view:DemoView;
        protected var group:IMultiLineLayout;
        //======================================================================
        //  Public methods: IXropeDemoController
        //======================================================================
        public function activate(view:DemoView):void
        {
            this.view = view;
            model.topAlignChanged.add(onTopAlignChanged);
            model.subAlignChanged.add(onSubAlignChanged);
            model.useBoundsChanged.add(onUseBoundsChanged);
            model.drawElementsChanged.add(onDrawElementsChanged);
            layout();
        }
        public function deactivate():void
        {
            model.topAlignChanged.remove(onTopAlignChanged);
            model.subAlignChanged.remove(onSubAlignChanged);
            model.useBoundsChanged.remove(onUseBoundsChanged);
            model.drawElementsChanged.remove(onDrawElementsChanged);
        }
        //======================================================================
        //  Private methods
        //======================================================================
        protected function layout():void
        {
            var w:Number = view.stage.stageWidth - 20;
            var h:Number = view.stage.stageHeight - view.y - 20;
            group = createGroup(w, h);
            group.lineAlign = model.subAlign;
            group.useBounds = model.useBounds;
            group.layoutContainer();
            redraw();
        }
        protected function createGroup(w:Number, h:Number):IMultiLineLayout
        {
            return new HBoxLayout(view, w, h, 10, 10, model.topAlign);
        }
        protected function redraw():void
        {
            view.graphics.clear();
            drawGroup();
            if (model.drawElements)
            {
                drawElements();
                drawLines();
            }
        }
        protected function drawLines():void
        {
            for each (var line:ILayoutElement in group.lines)
            {
                drawRim(view.graphics, line, 0, 0);
            }
        }
        protected function drawGroup():void
        {
            drawRim(view.graphics, group);
        }
        protected function drawElements():void
        {
            for each (var element:ILayoutElement in group.elements)
            {
                drawRim(view.graphics, element, 0, 0);
            }
        }
        //======================================================================
        //  Callbacks
        //======================================================================
        protected function onTopAlignChanged():void
        {
            group.align = model.topAlign;
            redraw();
        }
        protected function onSubAlignChanged():void
        {
            group.lineAlign = model.subAlign;
            redraw();
        }
        protected function onUseBoundsChanged():void
        {
            group.useBounds = model.useBounds;
            redraw();
        }
        protected function onDrawElementsChanged():void
        {
            redraw();
        }
    }
}