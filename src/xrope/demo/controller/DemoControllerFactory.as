package xrope.demo.controller
{
    import xrope.demo.GroupName;
    /**
     * @author eidiot
     */
    public class DemoControllerFactory
    {
        //======================================================================
        //  Dependencies
        //======================================================================
        [Inject]
        public var box:BoxController;
        [Inject]
        public var multiLine:MultiLineController;
        [Inject]
        public var grid:GridController;
        //======================================================================
        //  Public methods
        //======================================================================
        public function create(group:String):IXropeDemoController
        {
            switch (group)
            {
                case GroupName.GRID:
                    return grid;
                case GroupName.MULTILINE:
                    return multiLine;
                case GroupName.BOX:
                default:
                    return box;
            }
            return box;
        }
    }
}