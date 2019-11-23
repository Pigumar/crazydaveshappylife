package button
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class MButton extends Button
	{
		public var Num:uint;
		private var UpState:Texture;
		private var UpState2:Image;
		private var DownState:Image;
		private var OnState:Image;
		private var MouseMoving:Boolean=false;
		public function MButton(upstate:Texture, downstate:Image, onstate:Image, num:uint)
		{
			Num=num;
			UpState=upstate;
			super(UpState,"",null);
			UpState2 = new Image(UpState);
			addChild(UpState2);
			OnState=onstate;
			DownState=downstate;
			addChild(OnState);
			OnState.visible=false;
			addChild(DownState);
			DownState.visible=false;
			addEventListener(TouchEvent.TOUCH,onTouch);
		}
		public function Dark(colors:Number):void
		{
			for(var i:uint = 0; i<this.numChildren; i++)
			{
				if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip||this.getChildAt(i) is Button)
				{
					this.getChildAt(i).color = colors;
				}
			}
		}
		public function onTouch(eventObject:TouchEvent):void
		{
			var touch:Touch=eventObject.getTouch(this);
			if(touch)
			{
				switch(touch.phase)
				{
					case TouchPhase.BEGAN:
					{DownState.visible=true;/*trace("Mouse begin.");*/break;}
					case TouchPhase.HOVER:
					{OnState.visible=true;/*trace("Mouse in...");*/break;}
					case TouchPhase.ENDED:
						onClick();break;
					case TouchPhase.MOVED:
					{/*trace("Mouse moving.");*/MouseMoving=true;break;}
					case TouchPhase.STATIONARY:
						/*trace("Mouse stationed.");*/break;
					default:
						/*trace("unknown event.");*/break;
				}
			}
			else
			{
				/*trace("Mouse out...")*/
				OnState.visible=false;
			}
		}
		private function onClick():void
		{
			if(MouseMoving)
			{
				MouseMoving=false;
				DownState.visible=false;
				OnState.visible=false;
				return;
			}
			if(Num!=0)
				parent.sendMessage(Num);
			DownState.visible=false;
			OnState.visible=false;
			/*trace("Mouse ended.");*/
		}
	}
}