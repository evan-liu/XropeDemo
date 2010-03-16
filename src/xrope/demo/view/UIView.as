package xrope.demo.view
{
    import xrope.AtomLayout;
    import xrope.HLineLayout;
    import xrope.ILayoutGroup;
    import xrope.LayoutAlign;
    import xrope.VLineLayout;
    import xrope.demo.GroupName;
    import xrope.demo.model.DemoModel;
    import xrope.demo.utils.drawRim;

    import com.bit101.components.CheckBox;
    import com.bit101.components.Label;
    import com.bit101.components.RadioButton;

    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    /**
     * @author eidiot
     */
    public class UIView extends Sprite
    {
        //======================================================================
        //  Dependencies
        //======================================================================
        [Inject]
        public var model:DemoModel;
        //======================================================================
        //  Variables
        //======================================================================
        private var gridOnlyList:Array = [];
        private var defalutForNoneGrid:RadioButton;
        //======================================================================
        //  Public methods
        //======================================================================
        [PostConstruct]
        public function build():void
        {
            //-- Groups
            var groupsLayout:ILayoutGroup = new VLineLayout(this);
            groupsLayout.add(createLabel("Layout Groups:"));
            groupsLayout.add(createRaidoButton(GroupName.BOX, "groups", groupChangeHandler, true));
            groupsLayout.add(createRaidoButton(GroupName.MULTILINE, "groups", groupChangeHandler));
            groupsLayout.add(createRaidoButton(GroupName.GRID, "groups", groupChangeHandler));
            groupsLayout.layout();
            //-- Align
            var alignLayout:ILayoutGroup = new VLineLayout(this);
            alignLayout.add(createAligns("Top Align:", "topAlign", topAlignChangeHandler));
            alignLayout.add(createAligns("Sub Align:", "subAlign", subAlignChangeHandler));
            alignLayout.add(createLabel("(Sub align is lineAlign in Box and MultiLine, tileAlign in Grid)"));
            alignLayout.layout();
            //-- Options
            var optionLayout:ILayoutGroup = new VLineLayout(this);
            optionLayout.add(createLabel("Options:"));
            optionLayout.add(createCheckBox("useBounds", useBoundsChangeHandler, true));
            optionLayout.add(createCheckBox("Draw elements", drawElementChnageHandler, true));
            optionLayout.layout();
            //-- Top
            var uiLayout:ILayoutGroup = new HLineLayout(this, 10, 10);
            uiLayout.horizontalGap = 20;
            uiLayout.add(groupsLayout);
            uiLayout.add(alignLayout);
            uiLayout.add(optionLayout);
            uiLayout.layout();
            //
            drawRim(graphics, groupsLayout);
            drawRim(graphics, alignLayout);
            drawRim(graphics, optionLayout);
            //
            var subAlignElements:Array = ILayoutGroup(alignLayout.elements[1]).elements.slice(1);
            defalutForNoneGrid = RadioButton(AtomLayout(subAlignElements[1]).target);
            for each (var atom:AtomLayout in subAlignElements)
            {
                var radioButton:RadioButton = RadioButton(atom.target);
                if (radioButton.label != "T" && radioButton.label != "C" && radioButton.label != "B")
                {
                    gridOnlyList.push(radioButton);
                }
            }
            changeGridOnlyEnable(false);
        }
        //======================================================================
        //  Private methods
        //======================================================================
        private function createAligns(label:String, groupName:String, handler:Function):ILayoutGroup
        {
            var alignLayout:ILayoutGroup = new HLineLayout(this);
            alignLayout.align = LayoutAlign.LEFT;
            alignLayout.add(createLabel(label));
            alignLayout.add(createRaidoButton(LayoutAlign.TOP_LEFT, groupName, handler, true));
            alignLayout.add(createRaidoButton(LayoutAlign.TOP, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.TOP_RIGHT, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.RIGHT, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.BOTTOM_RIGHT, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.BOTTOM, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.BOTTOM_LEFT, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.LEFT, groupName, handler));
            alignLayout.add(createRaidoButton(LayoutAlign.CENTER, groupName, handler));
            alignLayout.layout();
            return alignLayout;
        }
        private function createLabel(text:String):DisplayObject
        {
            var label:Label = new Label();
            label.text = text;
            label.draw();
            return label;
        }
        private function createRaidoButton(label:String, groupName:String,
                                           handler:Function,
                                           selected:Boolean = false):DisplayObject
        {
            var radioButton:RadioButton = new RadioButton();
            radioButton.label = label;
            radioButton.groupName = groupName;
            radioButton.selected = selected;
            radioButton.draw();
            radioButton.addEventListener(MouseEvent.CLICK, handler);
            return radioButton;
        }
        private function createCheckBox(label:String, handler:Function, selected:Boolean):DisplayObject
        {
            var checkBox:CheckBox = new CheckBox();
            checkBox.label = label;
            checkBox.selected = selected;
            checkBox.draw();
            checkBox.addEventListener(MouseEvent.CLICK, handler);
            return checkBox;
        }
        private function changeGridOnlyEnable(value:Boolean):void
        {
            for each (var radioButton:RadioButton in gridOnlyList)
            {
                if (!value && radioButton.selected)
                {
                    radioButton.selected = false;
                    defalutForNoneGrid.selected = true;
                    model.subAlign = defalutForNoneGrid.label;
                }
                radioButton.mouseEnabled = value;
                radioButton.alpha = value ? 1 : 0.3;
            }
        }
        //======================================================================
        //  Event handlers
        //======================================================================
        private function groupChangeHandler(event:MouseEvent):void
        {
            var newGroup:String = RadioButton(event.target).label;
            if (model.group != newGroup)
            {
                changeGridOnlyEnable(newGroup == GroupName.GRID);
                model.group = newGroup;
            }
        }
        private function topAlignChangeHandler(event:MouseEvent):void
        {
            model.topAlign = RadioButton(event.target).label;
        }
        private function subAlignChangeHandler(event:MouseEvent):void
        {
            model.subAlign = RadioButton(event.target).label;
        }
        private function useBoundsChangeHandler(event:MouseEvent):void
        {
            model.useBounds = CheckBox(event.target).selected;
        }
        private function drawElementChnageHandler(event:MouseEvent):void
        {
            model.drawElements = CheckBox(event.target).selected;
        }
    }
}