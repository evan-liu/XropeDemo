package xrope.demo.utils
{
    import flash.display.Graphics;

    /**
     * @author eidiot
     */
    public function drawRim(graphics:Graphics, target:*,
                            margin:Number = 5, round:Number = 10):void
    {
        graphics.lineStyle(0, 0xCCCCCC, 0.5);
        graphics.drawRoundRect(target.x - margin, target.y - margin,
                               target.width + margin * 2,
                               target.height + margin * 2, round);
    }
}