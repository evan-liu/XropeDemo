package
{
    import xrope.demo.XropeDemoContext;

    import flash.display.Sprite;
    /**
     * @author eidiot
     */
    public class XropeDemo extends Sprite
    {
        //======================================================================
        //  Constructor
        //======================================================================
        public function XropeDemo()
        {
            super();
            context = new XropeDemoContext(this);
        }
        //======================================================================
        //  Variables
        //======================================================================
        private var context:XropeDemoContext;
    }
}