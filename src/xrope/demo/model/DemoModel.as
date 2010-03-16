package xrope.demo.model
{
    import org.osflash.signals.Signal;
    /**
     * @author eidiot
     */
    public class DemoModel
    {
        //======================================================================
        //  Properties
        //======================================================================
        public const groupChanged:Signal = new Signal();
        public const topAlignChanged:Signal = new Signal();
        public const subAlignChanged:Signal = new Signal();
        public const useBoundsChanged:Signal = new Signal();
        public const drawElementsChanged:Signal = new Signal();
        //------------------------------
        //  group
        //------------------------------
        private var _group:String = "Box";
        public function get group():String
        {
            return _group;
        }
        public function set group(value:String):void
        {
            if (value != _group)
            {
                _group = value;
                groupChanged.dispatch();
            }
        }
        //------------------------------
        //  topAlign
        //------------------------------
        private var _topAlign:String = "TL";
        public function get topAlign():String
        {
            return _topAlign;
        }
        public function set topAlign(value:String):void
        {
            if (value != _topAlign)
            {
                _topAlign = value;
                topAlignChanged.dispatch();
            }
        }
        //------------------------------
        //  subAlign
        //------------------------------
        private var _subAlign:String = "TL";
        public function get subAlign():String
        {
            return _subAlign;
        }
        public function set subAlign(value:String):void
        {
            if (value != _subAlign)
            {
                _subAlign = value;
                subAlignChanged.dispatch();
            }
        }
        //------------------------------
        //  useBounds
        //------------------------------
        private var _useBounds:Boolean = true;
        public function get useBounds():Boolean
        {
            return _useBounds;
        }
        public function set useBounds(value:Boolean):void
        {
            if (value != _useBounds)
            {
                _useBounds = value;
                useBoundsChanged.dispatch();
            }
        }
        //------------------------------
        //  drawElements
        //------------------------------
        private var _drawElements:Boolean = true;
        public function get drawElements():Boolean
        {
            return _drawElements;
        }
        public function set drawElements(value:Boolean):void
        {
            if (value != _drawElements)
            {
                _drawElements = value;
                drawElementsChanged.dispatch();
            }
        }
    }
}